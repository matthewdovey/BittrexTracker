//
//  OrderHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Order History Request struct to hold request state and result
struct OrderHistoryRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [OrderHistory]?
  
  init(success: Bool?, message: String?, result: [OrderHistory]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
