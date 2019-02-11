//
//  WithdrawResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct WithdrawResult {
  public let outcome: Outcome
  public let data: [Withdraw]

  init(outcome: Outcome, data: [Withdraw]) {
    self.outcome = outcome
    self.data = data
  }
}
