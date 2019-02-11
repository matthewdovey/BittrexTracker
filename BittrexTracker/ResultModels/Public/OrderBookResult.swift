//
//  OrderBookResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 10/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Order Book Result struct to hold Outcome and the data
public struct OrderBookResult {
  public let outcome: Outcome
  public let data: [OrderBook]
  
  init(outcome: Outcome, data: [OrderBook]) {
    self.outcome = outcome
    self.data = data
  }
}
