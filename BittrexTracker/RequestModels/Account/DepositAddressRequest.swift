//
//  DepositAddressRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Deposit Address Request struct to hold request state, message and result
struct DepositAddressRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: DepositAddress?
  
  init(success: Bool?, message: String?, result: DepositAddress?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
