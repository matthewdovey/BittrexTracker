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
  public let buy: [Transaction]?
  public let sell: [Transaction]?
  
  private enum CodingKeys: String, CodingKey {
    case buy = "buy"
    case sell = "sell"
  }
}

// The data structure for the Transaction objects within an Order Book Request
public struct Transaction: Decodable {
  public let quantity: Float?
  public let rate: Float?
  
  private enum CodingKeys: String, CodingKey {
    case quantity = "quantity"
    case rate = "rate"
  }
}
