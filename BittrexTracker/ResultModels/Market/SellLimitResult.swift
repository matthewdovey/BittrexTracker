//
//  SellLimitResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Sell Limit Result struct to hold Outcome and the data
public struct SellLimitResult {
  public let outcome: Outcome
  public let data: [SellLimit]
  
  init(outcome: Outcome, data: [SellLimit]) {
    self.outcome = outcome
    self.data = data
  }
}
