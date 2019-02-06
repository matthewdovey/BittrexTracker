//
//  OrderBook.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Order Book Request
public struct OrderBook {
  let buy: [String : Float]?
  let sell: [String : Float]?
  
  private enum CodingKeys: String, CodingKey {
    case buy = "buy"
    case sell = "sell"
  }
}
