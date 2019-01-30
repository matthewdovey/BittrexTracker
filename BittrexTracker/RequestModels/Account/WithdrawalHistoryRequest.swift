//
//  WithdrawalHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Withdrawal History Request struct to hold request state and result
struct WithdrawalHistoryRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [WithdrawalHistory]?
  
  init(success: Bool?, message: String?, result: [WithdrawalHistory]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
