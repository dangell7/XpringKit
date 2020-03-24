// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: payment.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

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

/// Payment transaction specific information.
/// Next field: 4
public struct Io_Xpring_Payment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The amount of currency to pay, in either fiat or XRP.
  public var amount: Io_Xpring_Payment.OneOf_Amount? = nil

  public var xrpAmount: Io_Xpring_XRPAmount {
    get {
      if case .xrpAmount(let v)? = amount {return v}
      return Io_Xpring_XRPAmount()
    }
    set {amount = .xrpAmount(newValue)}
  }

  public var fiatAmount: Io_Xpring_FiatAmount {
    get {
      if case .fiatAmount(let v)? = amount {return v}
      return Io_Xpring_FiatAmount()
    }
    set {amount = .fiatAmount(newValue)}
  }

  /// The destination of the payment.
  public var destination: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// The amount of currency to pay, in either fiat or XRP.
  public enum OneOf_Amount: Equatable {
    case xrpAmount(Io_Xpring_XRPAmount)
    case fiatAmount(Io_Xpring_FiatAmount)

  #if !swift(>=4.1)
    public static func ==(lhs: Io_Xpring_Payment.OneOf_Amount, rhs: Io_Xpring_Payment.OneOf_Amount) -> Bool {
      switch (lhs, rhs) {
      case (.xrpAmount(let l), .xrpAmount(let r)): return l == r
      case (.fiatAmount(let l), .fiatAmount(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "io.xpring"

extension Io_Xpring_Payment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Payment"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "xrp_amount"),
    2: .standard(proto: "fiat_amount"),
    3: .same(proto: "destination"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1:
        var v: Io_Xpring_XRPAmount?
        if let current = self.amount {
          try decoder.handleConflictingOneOf()
          if case .xrpAmount(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.amount = .xrpAmount(v)}
      case 2:
        var v: Io_Xpring_FiatAmount?
        if let current = self.amount {
          try decoder.handleConflictingOneOf()
          if case .fiatAmount(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.amount = .fiatAmount(v)}
      case 3: try decoder.decodeSingularStringField(value: &self.destination)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self.amount {
    case .xrpAmount(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    case .fiatAmount(let v)?:
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    case nil: break
    }
    if !self.destination.isEmpty {
      try visitor.visitSingularStringField(value: self.destination, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Io_Xpring_Payment, rhs: Io_Xpring_Payment) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.destination != rhs.destination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
