//
//  OrderBook.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Order Book Request
public struct OrderBook: Decodable {
  public let quantity: Float?
  public let rate: Float?
  
  private enum CodingKeys: String, CodingKey {
    case quantity = "Quantity"
    case rate = "Rate"
  }
}
