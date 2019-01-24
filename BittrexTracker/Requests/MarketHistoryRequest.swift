//
//  MarketHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Market History Request struct to hold request state and result
struct MarketHistoryRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [MarketHistoryResult]?
}

/// The data structure for the result of the Market History Request
struct MarketHistoryResult: Decodable {
  let id: String?
  let timeStamp: String?
  let quantity: Double?
  let price: Double?
  let total: Double?
  let fillType: String?
  let orderType: String?
  
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
