//
//  MarketHistory.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Market History Request
public struct MarketHistory: Decodable {
  public let id: String?
  public let timeStamp: String?
  public let quantity: Double?
  public let price: Double?
  public let total: Double?
  public let fillType: String?
  public let orderType: String?
  
  private enum CodingKeys: String, CodingKey {
    case id = "ID"
    case timeStamp = "TimeStamp"
    case quantity = "Quantity"
    case price = "Price"
    case total = "Total"
    case fillType = "FillType"
    case orderType = "OrderType"
  }
}
