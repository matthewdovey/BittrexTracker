//
//  BuyLimitResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 10/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct BuyLimitResult {
  public let outcome: Outcome
  public let data: [BuyLimit]
  
  init(outcome: Outcome, data: [BuyLimit]) {
    self.outcome = outcome
    self.data = data
  }
}
