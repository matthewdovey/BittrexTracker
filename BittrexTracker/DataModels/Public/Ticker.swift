//
//  Ticker.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Ticker Request
public struct Ticker: Decodable {
  let bid: Float?
  let ask: Float?
  let last: Float?
  
  private enum CodingKeys: String, CodingKey {
    case bid = "Bid"
    case ask = "Ask"
    case last = "Last"
  }
}
