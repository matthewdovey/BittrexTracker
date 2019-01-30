//
//  OrderBookRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Order Book Request struct to hold request state, message and result
struct OrderBookRequest: Decodable {
  let success: Bool?
  let message: String?
  
  init(success: Bool?, message: String?) {
    self.success = success
    self.message = message
  }
}
