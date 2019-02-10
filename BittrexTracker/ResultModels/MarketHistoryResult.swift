//
//  MarketHistoryResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 10/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct MarketHistoryResult {
  public let outcome: Outcome
  public let data: [MarketHistory]
  
  init(outcome: Outcome, data: [MarketHistory]) {
    self.outcome = outcome
    self.data = data
  }
}
