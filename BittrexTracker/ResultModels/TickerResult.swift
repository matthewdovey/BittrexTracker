//
//  TickerResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 10/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct TickerResult {
  public let outcome: Outcome
  public let data: [Ticker]
  
  init(outcome: Outcome, data: [Ticker]) {
    self.outcome = outcome
    self.data = data
  }
}
