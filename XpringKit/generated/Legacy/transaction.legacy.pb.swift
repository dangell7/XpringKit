// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: transaction.proto
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

/// A class encompassing all transactions.
/// Next field: 7.
public struct Io_Xpring_Transaction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The account originating the transaction.
  public var account: String = String()

  /// The fee attached to the transaction.
  public var fee: Io_Xpring_XRPAmount {
    get {return _fee ?? Io_Xpring_XRPAmount()}
    set {_fee = newValue}
  }
  /// Returns true if `fee` has been explicitly set.
  public var hasFee: Bool {return self._fee != nil}
  /// Clears the value of `fee`. Subsequent reads from it will return its default value.
  public mutating func clearFee() {self._fee = nil}

  /// The sequence number for the transaction.
  public var sequence: UInt64 = 0

  /// Data specific to a the type of transaction being submitted.
  public var transactionData: Io_Xpring_Transaction.OneOf_TransactionData? = nil

  public var payment: Io_Xpring_Payment {
    get {
      if case .payment(let v)? = transactionData {return v}
      return Io_Xpring_Payment()
    }
    set {transactionData = .payment(newValue)}
  }

  /// The public key of the account which signed the transaction in hexadecimal.
  public var signingPublicKeyHex: String = String()

  /// The highest ledger index this transaction can appear in.
  public var lastLedgerSequence: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Data specific to a the type of transaction being submitted.
  public enum OneOf_TransactionData: Equatable {
    case payment(Io_Xpring_Payment)

  #if !swift(>=4.1)
    public static func ==(lhs: Io_Xpring_Transaction.OneOf_TransactionData, rhs: Io_Xpring_Transaction.OneOf_TransactionData) -> Bool {
      switch (lhs, rhs) {
      case (.payment(let l), .payment(let r)): return l == r
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _fee: Io_Xpring_XRPAmount? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "io.xpring"

extension Io_Xpring_Transaction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Transaction"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "account"),
    2: .same(proto: "fee"),
    3: .same(proto: "sequence"),
    4: .same(proto: "payment"),
    5: .standard(proto: "signing_public_key_hex"),
    6: .standard(proto: "last_ledger_sequence"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.account)
      case 2: try decoder.decodeSingularMessageField(value: &self._fee)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.sequence)
      case 4:
        var v: Io_Xpring_Payment?
        if let current = self.transactionData {
          try decoder.handleConflictingOneOf()
          if case .payment(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionData = .payment(v)}
      case 5: try decoder.decodeSingularStringField(value: &self.signingPublicKeyHex)
      case 6: try decoder.decodeSingularUInt32Field(value: &self.lastLedgerSequence)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.account.isEmpty {
      try visitor.visitSingularStringField(value: self.account, fieldNumber: 1)
    }
    if let v = self._fee {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if self.sequence != 0 {
      try visitor.visitSingularUInt64Field(value: self.sequence, fieldNumber: 3)
    }
    if case .payment(let v)? = self.transactionData {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if !self.signingPublicKeyHex.isEmpty {
      try visitor.visitSingularStringField(value: self.signingPublicKeyHex, fieldNumber: 5)
    }
    if self.lastLedgerSequence != 0 {
      try visitor.visitSingularUInt32Field(value: self.lastLedgerSequence, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Io_Xpring_Transaction, rhs: Io_Xpring_Transaction) -> Bool {
    if lhs.account != rhs.account {return false}
    if lhs._fee != rhs._fee {return false}
    if lhs.sequence != rhs.sequence {return false}
    if lhs.transactionData != rhs.transactionData {return false}
    if lhs.signingPublicKeyHex != rhs.signingPublicKeyHex {return false}
    if lhs.lastLedgerSequence != rhs.lastLedgerSequence {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
