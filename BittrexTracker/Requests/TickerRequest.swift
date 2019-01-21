//
//  TickerRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

struct TickerRequest: Decodable {
    let success: Bool?
    let message: String?
    let result: TickerResult?
}

struct TickerResult: Decodable {
    let bid: Float?
    let ask: Float?
    let last: Float?
    
    private enum CodingKeys: String, CodingKey {
        case bid = "Bid"
        case ask = "Ask"
        case last = "Last"
    }
}
