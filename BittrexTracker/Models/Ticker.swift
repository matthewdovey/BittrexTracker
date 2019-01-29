//
//  TickerRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Ticker Request struct to hold request state and result
struct TickerRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: Ticker?
  
  init(success: Bool?, message: String?, result: Ticker?) {
    self.success = success
    self.message = message
    self.result = result
  }
}

/// The data structure for the result of the Ticker Request
struct Ticker: Decodable {
  let bid: Float?
  let ask: Float?
  let last: Float?
  
  private enum CodingKeys: String, CodingKey {
    case bid = "Bid"
    case ask = "Ask"
    case last = "Last"
  }
}
