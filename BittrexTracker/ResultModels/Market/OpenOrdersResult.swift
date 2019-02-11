//
//  OpenOrdersResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Open Orders Result struct to hold Outcome and the data
public struct OpenOrdersResult {
  public let outcome: Outcome
  public let data: [OpenOrders]
  
  init(outcome: Outcome, data: [OpenOrders]) {
    self.outcome = outcome
    self.data = data
  }
}
