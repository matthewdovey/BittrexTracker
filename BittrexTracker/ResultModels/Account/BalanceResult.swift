//
//  BalanceResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Balance Result struct to hold Outcome and the data
public struct BalanceResult {
  public let outcome: Outcome
  public let data: [Balance]
  
  init(outcome: Outcome, data: [Balance]) {
    self.outcome = outcome
    self.data = data
  }
}
