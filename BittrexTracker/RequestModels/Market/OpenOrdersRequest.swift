//
//  OpenOrdersRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Open Orders Request struct to hold request state, message and result
struct OpenOrdersRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [OpenOrders]?
  
  init(success: Bool?, message: String?, result: [OpenOrders]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
