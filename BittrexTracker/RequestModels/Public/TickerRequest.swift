//
//  TickerRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Ticker Request struct to hold request state, message and result
public struct TickerRequest: Decodable {
  public let success: Bool?
  public let message: String?
  public let result: Ticker?
  
  init(success: Bool?, message: String?, result: Ticker?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
