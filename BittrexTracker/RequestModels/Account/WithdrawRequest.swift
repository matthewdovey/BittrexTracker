//
//  WithdrawRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Withdraw Request struct to hold request state, message and result
struct WithdrawRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: Withdraw?
  
  init(success: Bool?, message: String?, result: Withdraw?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
