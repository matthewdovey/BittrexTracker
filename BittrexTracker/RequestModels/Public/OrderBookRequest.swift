//
//  OrderBookRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Order Book Request struct to hold request state, message and result
public struct OrderBookRequest: Decodable {
  public let success: Bool?
  public let message: String?
  // TODO: setup result property
  
  init(success: Bool?, message: String?) {
    self.success = success
    self.message = message
  }
}
