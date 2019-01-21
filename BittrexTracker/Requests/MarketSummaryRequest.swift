//
//  MarketSummaryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

struct MarketSummaryRequest: Decodable {
    let success: Bool?
    let message: String?
    let result: [MarketSummaryResult]?
}

struct MarketSummaryResult: Decodable {
    let marketName: String
    let high: Double
    let low: Double
    let volume: Double
    let last: Double
    let baseVolume: Double
    let timeStamp: String
    let bid: Double
    let ask: Double
    let openBuyOrders: Int
    let openSellOrders: Int
    let prevDay: Double
    let created: String
    
    private enum CodingKeys: String, CodingKey {
        case marketName = "MarketName"
        case high = "High"
        case low = "Low"
        case volume = "Volume"
        case last = "Last"
        case baseVolume = "BaseVolume"
        case timeStamp = "TimeStamp"
        case bid = "Bid"
        case ask = "Ask"
        case openBuyOrders = "OpenBuyOrders"
        case openSellOrders = "OpenSellOrders"
        case prevDay = "PrevDay"
        case created = "Created"
    }
}
