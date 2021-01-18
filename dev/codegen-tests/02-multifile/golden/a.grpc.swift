//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: a.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `A_ServiceAClient`, then call methods of this protocol to make API calls.
internal protocol A_ServiceAClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: A_ServiceAClientInterceptorFactoryProtocol? { get }

  func callServiceA(
    _ request: A_MessageA,
    callOptions: CallOptions?
  ) -> UnaryCall<A_MessageA, SwiftProtobuf.Google_Protobuf_Empty>
}

extension A_ServiceAClientProtocol {
  internal var serviceName: String {
    return "a.ServiceA"
  }

  /// Unary call to CallServiceA
  ///
  /// - Parameters:
  ///   - request: Request to send to CallServiceA.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func callServiceA(
    _ request: A_MessageA,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<A_MessageA, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: "/a.ServiceA/CallServiceA",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCallServiceAInterceptors() ?? []
    )
  }
}

internal protocol A_ServiceAClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'callServiceA'.
  func makeCallServiceAInterceptors() -> [ClientInterceptor<A_MessageA, SwiftProtobuf.Google_Protobuf_Empty>]
}

internal final class A_ServiceAClient: A_ServiceAClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: A_ServiceAClientInterceptorFactoryProtocol?

  /// Creates a client for the a.ServiceA service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: A_ServiceAClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol A_ServiceAProvider: CallHandlerProvider {
  var interceptors: A_ServiceAServerInterceptorFactoryProtocol? { get }

  func callServiceA(request: A_MessageA, context: StatusOnlyCallContext) -> EventLoopFuture<SwiftProtobuf.Google_Protobuf_Empty>
}

extension A_ServiceAProvider {
  internal var serviceName: Substring { return "a.ServiceA" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CallServiceA":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<A_MessageA>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeCallServiceAInterceptors() ?? [],
        userFunction: self.callServiceA(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol A_ServiceAServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'callServiceA'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCallServiceAInterceptors() -> [ServerInterceptor<A_MessageA, SwiftProtobuf.Google_Protobuf_Empty>]
}
