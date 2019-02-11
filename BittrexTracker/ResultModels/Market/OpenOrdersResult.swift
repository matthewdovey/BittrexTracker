//
//  OpenOrdersResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct OpenOrdersResult {
  public let outcome: Outcome
  public let data: [OpenOrders]
  
  init(outcome: Outcome, data: [OpenOrders]) {
    self.outcome = outcome
    self.data = data
  }
}
