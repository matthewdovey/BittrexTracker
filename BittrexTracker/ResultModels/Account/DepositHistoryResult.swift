//
//  DepositHistoryResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct DepositHistoryResult {
  public let outcome: Outcome
  public let data: [DepositHistory]
  
  init(outcome: Outcome, data: [DepositHistory]) {
    self.outcome = outcome
    self.data = data
  }
}
