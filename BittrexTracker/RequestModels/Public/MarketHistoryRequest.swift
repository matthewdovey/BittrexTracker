//
//  MarketHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Market History Request struct to hold request state, message and result
public struct MarketHistoryRequest: Decodable {
  public let success: Bool?
  public let message: String?
  public let result: [MarketHistory]?
  
  init(success: Bool?, message: String?, result: [MarketHistory]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}
