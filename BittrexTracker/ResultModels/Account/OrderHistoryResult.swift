//
//  OrderHistoryResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Order History Result struct to hold Outcome and the data
public struct OrderHistoryResult {
  public let outcome: Outcome
  public let data: [OrderHistory]
  
  init(outcome: Outcome, data: [OrderHistory]) {
    self.outcome = outcome
    self.data = data
  }
}
