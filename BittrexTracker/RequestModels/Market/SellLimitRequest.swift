//
//  SellLimitRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Buy Limit Request struct to hold request state, message and result
struct SellLimitRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: SellLimit?
  
  init(success: Bool?, message: String?, result: SellLimit) {
    self.success = success
    self.message = message
    self.result = result
  }
}
