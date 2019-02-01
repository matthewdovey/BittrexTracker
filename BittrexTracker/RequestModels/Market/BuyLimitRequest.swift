//
//  BuyLimitRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Buy Limit Request struct to hold request state, message and result
struct BuyLimitRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: BuyLimit?
  
  init(success: Bool?, message: String?, result: BuyLimit?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
