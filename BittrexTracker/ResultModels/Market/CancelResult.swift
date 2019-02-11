//
//  CancelResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Cancel Result struct to hold Outcome and the data
public struct CancelResult {
  public let outcome: Outcome
  public let data: [Cancel]
  
  init(outcome: Outcome, data: [Cancel]) {
    self.outcome = outcome
    self.data = data
  }
}
