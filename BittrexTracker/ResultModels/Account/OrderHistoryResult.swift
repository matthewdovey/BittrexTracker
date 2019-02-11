//
//  OrderHistoryResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct OrderHistoryResult {
  public let outcome: Outcome
  public let data: [OrderHistory]
  
  init(outcome: Outcome, data: [OrderHistory]) {
    self.outcome = outcome
    self.data = data
  }
}
