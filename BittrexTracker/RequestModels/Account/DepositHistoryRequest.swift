//
//  DepositHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Deposit History Request struct to hold request state, message and result
struct DepositHistoryRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [DepositHistory]?
  
  init(success: Bool?, message: String?, result: [DepositHistory]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
