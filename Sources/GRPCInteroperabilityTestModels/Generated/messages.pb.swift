// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: src/proto/grpc/testing/messages.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2015-2016 gRPC authors.
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

// Message definitions to be used by integration test service definitions.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// The type of payload that should be returned.
public enum Grpc_Testing_PayloadType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Compressable text format.
  case compressable // = 0
  case UNRECOGNIZED(Int)

  public init() {
    self = .compressable
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .compressable
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .compressable: return 0
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Grpc_Testing_PayloadType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Grpc_Testing_PayloadType] = [
    .compressable,
  ]
}

#endif  // swift(>=4.2)

/// TODO(dgq): Go back to using well-known types once
/// https://github.com/grpc/grpc/issues/6980 has been fixed.
/// import "google/protobuf/wrappers.proto";
public struct Grpc_Testing_BoolValue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The bool value.
  public var value: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// A block of data, to simply increase gRPC message size.
public struct Grpc_Testing_Payload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The type of data in body.
  public var type: Grpc_Testing_PayloadType = .compressable

  /// Primary contents of payload.
  public var body: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// A protobuf representation for grpc status. This is used by test
/// clients to specify a status that the server should attempt to return.
public struct Grpc_Testing_EchoStatus {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var code: Int32 = 0

  public var message: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Unary request.
public struct Grpc_Testing_SimpleRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Desired payload type in the response from the server.
  /// If response_type is RANDOM, server randomly chooses one from other formats.
  public var responseType: Grpc_Testing_PayloadType = .compressable

  /// Desired payload size in the response from the server.
  public var responseSize: Int32 = 0

  /// Optional input payload sent along with the request.
  public var payload: Grpc_Testing_Payload {
    get {return _payload ?? Grpc_Testing_Payload()}
    set {_payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  public var hasPayload: Bool {return self._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  public mutating func clearPayload() {self._payload = nil}

  /// Whether SimpleResponse should include username.
  public var fillUsername: Bool = false

  /// Whether SimpleResponse should include OAuth scope.
  public var fillOauthScope: Bool = false

  /// Whether to request the server to compress the response. This field is
  /// "nullable" in order to interoperate seamlessly with clients not able to
  /// implement the full compression tests by introspecting the call to verify
  /// the response's compression status.
  public var responseCompressed: Grpc_Testing_BoolValue {
    get {return _responseCompressed ?? Grpc_Testing_BoolValue()}
    set {_responseCompressed = newValue}
  }
  /// Returns true if `responseCompressed` has been explicitly set.
  public var hasResponseCompressed: Bool {return self._responseCompressed != nil}
  /// Clears the value of `responseCompressed`. Subsequent reads from it will return its default value.
  public mutating func clearResponseCompressed() {self._responseCompressed = nil}

  /// Whether server should return a given status
  public var responseStatus: Grpc_Testing_EchoStatus {
    get {return _responseStatus ?? Grpc_Testing_EchoStatus()}
    set {_responseStatus = newValue}
  }
  /// Returns true if `responseStatus` has been explicitly set.
  public var hasResponseStatus: Bool {return self._responseStatus != nil}
  /// Clears the value of `responseStatus`. Subsequent reads from it will return its default value.
  public mutating func clearResponseStatus() {self._responseStatus = nil}

  /// Whether the server should expect this request to be compressed.
  public var expectCompressed: Grpc_Testing_BoolValue {
    get {return _expectCompressed ?? Grpc_Testing_BoolValue()}
    set {_expectCompressed = newValue}
  }
  /// Returns true if `expectCompressed` has been explicitly set.
  public var hasExpectCompressed: Bool {return self._expectCompressed != nil}
  /// Clears the value of `expectCompressed`. Subsequent reads from it will return its default value.
  public mutating func clearExpectCompressed() {self._expectCompressed = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _payload: Grpc_Testing_Payload? = nil
  fileprivate var _responseCompressed: Grpc_Testing_BoolValue? = nil
  fileprivate var _responseStatus: Grpc_Testing_EchoStatus? = nil
  fileprivate var _expectCompressed: Grpc_Testing_BoolValue? = nil
}

/// Unary response, as configured by the request.
public struct Grpc_Testing_SimpleResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Payload to increase message size.
  public var payload: Grpc_Testing_Payload {
    get {return _payload ?? Grpc_Testing_Payload()}
    set {_payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  public var hasPayload: Bool {return self._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  public mutating func clearPayload() {self._payload = nil}

  /// The user the request came from, for verifying authentication was
  /// successful when the client expected it.
  public var username: String = String()

  /// OAuth scope.
  public var oauthScope: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _payload: Grpc_Testing_Payload? = nil
}

/// Client-streaming request.
public struct Grpc_Testing_StreamingInputCallRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Optional input payload sent along with the request.
  public var payload: Grpc_Testing_Payload {
    get {return _payload ?? Grpc_Testing_Payload()}
    set {_payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  public var hasPayload: Bool {return self._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  public mutating func clearPayload() {self._payload = nil}

  /// Whether the server should expect this request to be compressed. This field
  /// is "nullable" in order to interoperate seamlessly with servers not able to
  /// implement the full compression tests by introspecting the call to verify
  /// the request's compression status.
  public var expectCompressed: Grpc_Testing_BoolValue {
    get {return _expectCompressed ?? Grpc_Testing_BoolValue()}
    set {_expectCompressed = newValue}
  }
  /// Returns true if `expectCompressed` has been explicitly set.
  public var hasExpectCompressed: Bool {return self._expectCompressed != nil}
  /// Clears the value of `expectCompressed`. Subsequent reads from it will return its default value.
  public mutating func clearExpectCompressed() {self._expectCompressed = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _payload: Grpc_Testing_Payload? = nil
  fileprivate var _expectCompressed: Grpc_Testing_BoolValue? = nil
}

/// Client-streaming response.
public struct Grpc_Testing_StreamingInputCallResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Aggregated size of payloads received from the client.
  public var aggregatedPayloadSize: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Configuration for a particular response.
public struct Grpc_Testing_ResponseParameters {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Desired payload sizes in responses from the server.
  public var size: Int32 = 0

  /// Desired interval between consecutive responses in the response stream in
  /// microseconds.
  public var intervalUs: Int32 = 0

  /// Whether to request the server to compress the response. This field is
  /// "nullable" in order to interoperate seamlessly with clients not able to
  /// implement the full compression tests by introspecting the call to verify
  /// the response's compression status.
  public var compressed: Grpc_Testing_BoolValue {
    get {return _compressed ?? Grpc_Testing_BoolValue()}
    set {_compressed = newValue}
  }
  /// Returns true if `compressed` has been explicitly set.
  public var hasCompressed: Bool {return self._compressed != nil}
  /// Clears the value of `compressed`. Subsequent reads from it will return its default value.
  public mutating func clearCompressed() {self._compressed = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _compressed: Grpc_Testing_BoolValue? = nil
}

/// Server-streaming request.
public struct Grpc_Testing_StreamingOutputCallRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Desired payload type in the response from the server.
  /// If response_type is RANDOM, the payload from each response in the stream
  /// might be of different types. This is to simulate a mixed type of payload
  /// stream.
  public var responseType: Grpc_Testing_PayloadType = .compressable

  /// Configuration for each expected response message.
  public var responseParameters: [Grpc_Testing_ResponseParameters] = []

  /// Optional input payload sent along with the request.
  public var payload: Grpc_Testing_Payload {
    get {return _payload ?? Grpc_Testing_Payload()}
    set {_payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  public var hasPayload: Bool {return self._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  public mutating func clearPayload() {self._payload = nil}

  /// Whether server should return a given status
  public var responseStatus: Grpc_Testing_EchoStatus {
    get {return _responseStatus ?? Grpc_Testing_EchoStatus()}
    set {_responseStatus = newValue}
  }
  /// Returns true if `responseStatus` has been explicitly set.
  public var hasResponseStatus: Bool {return self._responseStatus != nil}
  /// Clears the value of `responseStatus`. Subsequent reads from it will return its default value.
  public mutating func clearResponseStatus() {self._responseStatus = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _payload: Grpc_Testing_Payload? = nil
  fileprivate var _responseStatus: Grpc_Testing_EchoStatus? = nil
}

/// Server-streaming response, as configured by the request and parameters.
public struct Grpc_Testing_StreamingOutputCallResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Payload to increase response size.
  public var payload: Grpc_Testing_Payload {
    get {return _payload ?? Grpc_Testing_Payload()}
    set {_payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  public var hasPayload: Bool {return self._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  public mutating func clearPayload() {self._payload = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _payload: Grpc_Testing_Payload? = nil
}

/// For reconnect interop test only.
/// Client tells server what reconnection parameters it used.
public struct Grpc_Testing_ReconnectParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var maxReconnectBackoffMs: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// For reconnect interop test only.
/// Server tells client whether its reconnects are following the spec and the
/// reconnect backoffs it saw.
public struct Grpc_Testing_ReconnectInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var passed: Bool = false

  public var backoffMs: [Int32] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "grpc.testing"

extension Grpc_Testing_PayloadType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "COMPRESSABLE"),
  ]
}

extension Grpc_Testing_BoolValue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BoolValue"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.value != false {
      try visitor.visitSingularBoolField(value: self.value, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_BoolValue, rhs: Grpc_Testing_BoolValue) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_Payload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Payload"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "body"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.type) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.body) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .compressable {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    if !self.body.isEmpty {
      try visitor.visitSingularBytesField(value: self.body, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_Payload, rhs: Grpc_Testing_Payload) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.body != rhs.body {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_EchoStatus: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EchoStatus"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "code"),
    2: .same(proto: "message"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.code) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.message) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.code != 0 {
      try visitor.visitSingularInt32Field(value: self.code, fieldNumber: 1)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_EchoStatus, rhs: Grpc_Testing_EchoStatus) -> Bool {
    if lhs.code != rhs.code {return false}
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_SimpleRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SimpleRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "response_type"),
    2: .standard(proto: "response_size"),
    3: .same(proto: "payload"),
    4: .standard(proto: "fill_username"),
    5: .standard(proto: "fill_oauth_scope"),
    6: .standard(proto: "response_compressed"),
    7: .standard(proto: "response_status"),
    8: .standard(proto: "expect_compressed"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.responseType) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.responseSize) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._payload) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.fillUsername) }()
      case 5: try { try decoder.decodeSingularBoolField(value: &self.fillOauthScope) }()
      case 6: try { try decoder.decodeSingularMessageField(value: &self._responseCompressed) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._responseStatus) }()
      case 8: try { try decoder.decodeSingularMessageField(value: &self._expectCompressed) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.responseType != .compressable {
      try visitor.visitSingularEnumField(value: self.responseType, fieldNumber: 1)
    }
    if self.responseSize != 0 {
      try visitor.visitSingularInt32Field(value: self.responseSize, fieldNumber: 2)
    }
    try { if let v = self._payload {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    if self.fillUsername != false {
      try visitor.visitSingularBoolField(value: self.fillUsername, fieldNumber: 4)
    }
    if self.fillOauthScope != false {
      try visitor.visitSingularBoolField(value: self.fillOauthScope, fieldNumber: 5)
    }
    try { if let v = self._responseCompressed {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    } }()
    try { if let v = self._responseStatus {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    } }()
    try { if let v = self._expectCompressed {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_SimpleRequest, rhs: Grpc_Testing_SimpleRequest) -> Bool {
    if lhs.responseType != rhs.responseType {return false}
    if lhs.responseSize != rhs.responseSize {return false}
    if lhs._payload != rhs._payload {return false}
    if lhs.fillUsername != rhs.fillUsername {return false}
    if lhs.fillOauthScope != rhs.fillOauthScope {return false}
    if lhs._responseCompressed != rhs._responseCompressed {return false}
    if lhs._responseStatus != rhs._responseStatus {return false}
    if lhs._expectCompressed != rhs._expectCompressed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_SimpleResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SimpleResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "payload"),
    2: .same(proto: "username"),
    3: .standard(proto: "oauth_scope"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._payload) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.username) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.oauthScope) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._payload {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.username.isEmpty {
      try visitor.visitSingularStringField(value: self.username, fieldNumber: 2)
    }
    if !self.oauthScope.isEmpty {
      try visitor.visitSingularStringField(value: self.oauthScope, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_SimpleResponse, rhs: Grpc_Testing_SimpleResponse) -> Bool {
    if lhs._payload != rhs._payload {return false}
    if lhs.username != rhs.username {return false}
    if lhs.oauthScope != rhs.oauthScope {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_StreamingInputCallRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".StreamingInputCallRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "payload"),
    2: .standard(proto: "expect_compressed"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._payload) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._expectCompressed) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._payload {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._expectCompressed {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_StreamingInputCallRequest, rhs: Grpc_Testing_StreamingInputCallRequest) -> Bool {
    if lhs._payload != rhs._payload {return false}
    if lhs._expectCompressed != rhs._expectCompressed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_StreamingInputCallResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".StreamingInputCallResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "aggregated_payload_size"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.aggregatedPayloadSize) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.aggregatedPayloadSize != 0 {
      try visitor.visitSingularInt32Field(value: self.aggregatedPayloadSize, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_StreamingInputCallResponse, rhs: Grpc_Testing_StreamingInputCallResponse) -> Bool {
    if lhs.aggregatedPayloadSize != rhs.aggregatedPayloadSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_ResponseParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ResponseParameters"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "size"),
    2: .standard(proto: "interval_us"),
    3: .same(proto: "compressed"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.size) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.intervalUs) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._compressed) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.size != 0 {
      try visitor.visitSingularInt32Field(value: self.size, fieldNumber: 1)
    }
    if self.intervalUs != 0 {
      try visitor.visitSingularInt32Field(value: self.intervalUs, fieldNumber: 2)
    }
    try { if let v = self._compressed {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_ResponseParameters, rhs: Grpc_Testing_ResponseParameters) -> Bool {
    if lhs.size != rhs.size {return false}
    if lhs.intervalUs != rhs.intervalUs {return false}
    if lhs._compressed != rhs._compressed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_StreamingOutputCallRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".StreamingOutputCallRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "response_type"),
    2: .standard(proto: "response_parameters"),
    3: .same(proto: "payload"),
    7: .standard(proto: "response_status"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.responseType) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.responseParameters) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._payload) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._responseStatus) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.responseType != .compressable {
      try visitor.visitSingularEnumField(value: self.responseType, fieldNumber: 1)
    }
    if !self.responseParameters.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.responseParameters, fieldNumber: 2)
    }
    try { if let v = self._payload {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._responseStatus {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_StreamingOutputCallRequest, rhs: Grpc_Testing_StreamingOutputCallRequest) -> Bool {
    if lhs.responseType != rhs.responseType {return false}
    if lhs.responseParameters != rhs.responseParameters {return false}
    if lhs._payload != rhs._payload {return false}
    if lhs._responseStatus != rhs._responseStatus {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_StreamingOutputCallResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".StreamingOutputCallResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "payload"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._payload) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._payload {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_StreamingOutputCallResponse, rhs: Grpc_Testing_StreamingOutputCallResponse) -> Bool {
    if lhs._payload != rhs._payload {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_ReconnectParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ReconnectParams"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_reconnect_backoff_ms"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt32Field(value: &self.maxReconnectBackoffMs) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.maxReconnectBackoffMs != 0 {
      try visitor.visitSingularInt32Field(value: self.maxReconnectBackoffMs, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_ReconnectParams, rhs: Grpc_Testing_ReconnectParams) -> Bool {
    if lhs.maxReconnectBackoffMs != rhs.maxReconnectBackoffMs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Grpc_Testing_ReconnectInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ReconnectInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "passed"),
    2: .standard(proto: "backoff_ms"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.passed) }()
      case 2: try { try decoder.decodeRepeatedInt32Field(value: &self.backoffMs) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.passed != false {
      try visitor.visitSingularBoolField(value: self.passed, fieldNumber: 1)
    }
    if !self.backoffMs.isEmpty {
      try visitor.visitPackedInt32Field(value: self.backoffMs, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Grpc_Testing_ReconnectInfo, rhs: Grpc_Testing_ReconnectInfo) -> Bool {
    if lhs.passed != rhs.passed {return false}
    if lhs.backoffMs != rhs.backoffMs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
