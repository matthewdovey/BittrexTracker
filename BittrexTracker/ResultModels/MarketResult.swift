//
//  Market Result.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 10/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct MarketResult {
  public let outcome: Outcome
  public let data: [Market]
  
  init(outcome: Outcome, data: [Coin]) {
    self.outcome = outcome
    self.data = data
  }
}
