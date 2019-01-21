//
//  DepositHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

struct DepositHistoryRequest: Decodable {
    let success: Bool?
    let message: String?
    let result: [DepositHistoryResult]?
}

struct DepositHistoryResult: Decodable {
    let paymentUuid: String?
    let currency: String?
    let amount: Double?
    let address: String?
    let opened: String?
    let authorized: Bool?
    let pendingPayment: Bool?
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
        case pendingPayment = "PendingPayment"
        case txCost = "TxCost"
        case txId = "TxID"
        case canceled = "Canceled"
        case invalidAddress = "InvalidAddress"
    }
}
