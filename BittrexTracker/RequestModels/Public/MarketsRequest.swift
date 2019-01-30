//
//  MarketsRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Markets Request struct to hold request state and result
struct MarketsRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [Market]?
  
  init(success: Bool?, message: String?, result: [Market]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
