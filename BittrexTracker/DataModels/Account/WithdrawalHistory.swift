//
//  WithdrawalHistory.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Withdrawal History Request
public struct WithdrawalHistory: Decodable {
  public let paymentUuid: String?
  public let currency: String?
  public let amount: Double?
  public let address: String?
  public let opened: String?
  public let authorized: Bool?
  public let pendingPayments: Bool?
  public let txCost: Double?
  public let txId: String?
  public let canceled: Bool?
  public let invalidAddress: Bool?
  
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
