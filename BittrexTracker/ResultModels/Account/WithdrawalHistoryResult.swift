//
//  WithdrawalHistoryResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Withdrawal History Result struct to hold Outcome and the data
public struct WithdrawalHistoryResult {
  public let outcome: Outcome
  public let data: [WithdrawalHistory]

  init(outcome: Outcome, data: [WithdrawalHistory]) {
    self.outcome = outcome
    self.data = data
  }
}
