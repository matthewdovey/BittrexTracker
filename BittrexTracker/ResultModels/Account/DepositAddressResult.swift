//
//  DepositAddressResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Deposit Address Result struct to hold Outcome and the data
public struct DepositAddressResult {
  public let outcome: Outcome
  public let data: [DepositAddress]

  init(outcome: Outcome, data: [DepositAddress]) {
    self.outcome = outcome
    self.data = data
  }
}
