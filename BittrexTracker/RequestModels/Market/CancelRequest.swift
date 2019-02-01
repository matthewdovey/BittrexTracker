//
//  CancelRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Cancel Request struct to hold request state, message and result
struct CancelRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: Cancel?
  
  init(success: Bool?, message: String?, result: Cancel) {
    self.success = success
    self.message = message
    self.result = result
  }
}
