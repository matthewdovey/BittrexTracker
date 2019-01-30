//
//  BalanceRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Balances Request struct to hold request state, message and result
struct BalancesRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [Balance]?
  
  init(success: Bool?, message: String?, result: [Balance]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
