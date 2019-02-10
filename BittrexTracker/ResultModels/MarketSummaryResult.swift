//
//  MarketSummaryResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 10/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct MarketSummaryResult {
  public let outcome: Outcome
  public let data: [MarketSummary]
  
  init(outcome: Outcome, data: [MarketSummary]) {
    self.outcome = outcome
    self.data = data
  }
}
