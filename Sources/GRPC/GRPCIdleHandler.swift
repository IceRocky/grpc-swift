/*
 * Copyright 2020, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Logging
import NIO
import NIOHTTP2

internal final class GRPCIdleHandler: ChannelInboundHandler {
  typealias InboundIn = HTTP2Frame
  typealias OutboundOut = HTTP2Frame

  /// The amount of time to wait before closing the channel when there are no active streams.
  private let idleTimeout: TimeAmount

  /// The mode we're operating in.
  private let mode: Mode

  /// A logger.
  private let logger: Logger

  private var context: ChannelHandlerContext?

  /// The mode of operation: the client tracks additional connection state in the connection
  /// manager.
  internal enum Mode {
    case client(ConnectionManager, HTTP2StreamMultiplexer)
    case server

    var connectionManager: ConnectionManager? {
      switch self {
      case let .client(manager, _):
        return manager
      case .server:
        return nil
      }
    }
  }

  /// The current state.
  private var stateMachine: GRPCIdleHandlerStateMachine

  init(mode: Mode, logger: Logger, idleTimeout: TimeAmount) {
    self.mode = mode
    self.idleTimeout = idleTimeout
    self.logger = logger

    switch mode {
    case .client:
      self.stateMachine = .init(role: .client, logger: logger)
    case .server:
      self.stateMachine = .init(role: .server, logger: logger)
    }
  }

  private func sendGoAway(lastStreamID streamID: HTTP2StreamID) {
    guard let context = self.context else {
      return
    }

    let frame = HTTP2Frame(
      streamID: .rootStream,
      payload: .goAway(lastStreamID: streamID, errorCode: .noError, opaqueData: nil)
    )

    context.writeAndFlush(self.wrapOutboundOut(frame), promise: nil)
  }

  private func perform(operations: GRPCIdleHandlerStateMachine.Operations) {
    // Prod the connection manager.
    if let event = operations.connectionManagerEvent, let manager = self.mode.connectionManager {
      switch event {
      case .idle:
        manager.idle()
      case .inactive:
        manager.channelInactive()
      case .ready:
        manager.ready()
      case .quiescing:
        manager.beginQuiescing()
      }
    }

    // Handle idle timeout creation/cancellation.
    if let idleTask = operations.idleTask {
      switch idleTask {
      case let .cancel(task):
        task.cancel()

      case .schedule:
        if self.idleTimeout != .nanoseconds(.max), let context = self.context {
          let task = context.eventLoop.scheduleTask(in: self.idleTimeout) {
            self.idleTimeoutFired()
          }
          self.perform(operations: self.stateMachine.scheduledIdleTimeoutTask(task))
        }
      }
    }

    // Send a GOAWAY frame.
    if let streamID = operations.sendGoAwayWithLastPeerInitiatedStreamID {
      let goAwayFrame = HTTP2Frame(
        streamID: .rootStream,
        payload: .goAway(lastStreamID: streamID, errorCode: .noError, opaqueData: nil)
      )
      self.context?.writeAndFlush(self.wrapOutboundOut(goAwayFrame), promise: nil)
    }

    // Close the channel, if necessary.
    if operations.shouldCloseChannel {
      self.context?.close(mode: .all, promise: nil)
    }
  }

  private func idleTimeoutFired() {
    self.perform(operations: self.stateMachine.idleTimeoutTaskFired())
  }

  func handlerAdded(context: ChannelHandlerContext) {
    self.context = context
  }

  func handlerRemoved(context: ChannelHandlerContext) {
    self.context = nil
  }

  func userInboundEventTriggered(context: ChannelHandlerContext, event: Any) {
    if let created = event as? NIOHTTP2StreamCreatedEvent {
      self.perform(operations: self.stateMachine.streamCreated(withID: created.streamID))
      context.fireUserInboundEventTriggered(event)
    } else if let closed = event as? StreamClosedEvent {
      self.perform(operations: self.stateMachine.streamClosed(withID: closed.streamID))
      context.fireUserInboundEventTriggered(event)
    } else if event is ChannelShouldQuiesceEvent {
      self.perform(operations: self.stateMachine.initiateGracefulShutdown())
      // Swallow this event.
    } else if event is ConnectionIdledEvent {
      self.perform(operations: self.stateMachine.shutdownNow())
      // Swallow this event.
    } else {
      context.fireUserInboundEventTriggered(event)
    }
  }

  func errorCaught(context: ChannelHandlerContext, error: Error) {
    // No state machine action here.
    self.mode.connectionManager?.channelError(error)
    context.fireErrorCaught(error)
  }

  func channelActive(context: ChannelHandlerContext) {
    // No state machine action here.
    switch self.mode {
    case let .client(connectionManager, multiplexer):
      connectionManager.channelActive(channel: context.channel, multiplexer: multiplexer)
    case .server:
      ()
    }
    context.fireChannelActive()
  }

  func channelInactive(context: ChannelHandlerContext) {
    self.perform(operations: self.stateMachine.channelInactive())
    context.fireChannelInactive()
  }

  func channelRead(context: ChannelHandlerContext, data: NIOAny) {
    let frame = self.unwrapInboundIn(data)

    switch frame.payload {
    case .goAway:
      self.perform(operations: self.stateMachine.receiveGoAway())
    case let .settings(.settings(settings)):
      self.perform(operations: self.stateMachine.receiveSettings(settings))
    default:
      // We're not interested in other events.
      ()
    }

    context.fireChannelRead(data)
  }
}

extension HTTP2SettingsParameter {
  internal var loggingMetadataKey: String {
    switch self {
    case .headerTableSize:
      return "h2_settings_header_table_size"
    case .enablePush:
      return "h2_settings_enable_push"
    case .maxConcurrentStreams:
      return "h2_settings_max_concurrent_streams"
    case .initialWindowSize:
      return "h2_settings_initial_window_size"
    case .maxFrameSize:
      return "h2_settings_max_frame_size"
    case .maxHeaderListSize:
      return "h2_settings_max_header_list_size"
    case .enableConnectProtocol:
      return "h2_settings_enable_connect_protocol"
    default:
      return String(describing: self)
    }
  }
}
