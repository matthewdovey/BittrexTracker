//
//  OrderResult.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 11/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct OrderResult {
  public let outcome: Outcome
  public let data: [Order]

  init(outcome: Outcome, data: [Order]) {
    self.outcome = outcome
    self.data = data
  }
}
