//
//  WithdrawalHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Withdrawal History Request struct to hold request state and result
struct WithdrawalHistoryRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [WithdrawalHistory]?
}

/// The data structure for the result of the Withdrawal History Request
struct WithdrawalHistory: Decodable {
  let paymentUuid: String?
  let currency: String?
  let amount: Double?
  let address: String?
  let opened: String?
  let authorized: Bool?
  let pendingPayments: Bool?
  let txCost: Double?
  let txId: String?
  let canceled: Bool?
  let invalidAddress: Bool?
  
  private enum CodingKeys: String, CodingKey {
    case paymentUuid = "PaymentUUID"
    case currency = "Currency"
    case amount = "Amount"
    case address = "Address"
    case opened = "Opened"
    case authorized = "Authorized"
    case pendingPayments = "PendingPayments"
    case txCost = "TxCost"
    case txId = "TxID"
    case canceled = "Canceled"
    case invalidAddress = "InvalidAddress"
  }
}
