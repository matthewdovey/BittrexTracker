//
//  BalanceRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

struct BalanceRequest: Decodable {
    let success: Bool?
    let message: String?
    let result: [BalanceResult]?
}

struct BalanceResult: Decodable {
    let currency: String?
    let balance: Double?
    let available: Double?
    let pending: Double?
    let cryptoAddress: String?
    let requested: Bool?
    let uuid: String?
    
    private enum CodingKeys: String, CodingKey {
        case currency = "Currency"
        case balance = "Balance"
        case available = "Available"
        case pending = "Pending"
        case cryptoAddress = "CryptoAddress"
        case requested = "Requested"
        case uuid = "UUID"
    }
}
