//
//  Result.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 10/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Coin Result struct to hold Outcome and the data
public struct CoinResult {
  public let outcome: Outcome
  public let data: [Coin]
  
  init(outcome: Outcome, data: [Coin]) {
    self.outcome = outcome
    self.data = data
  }
}
