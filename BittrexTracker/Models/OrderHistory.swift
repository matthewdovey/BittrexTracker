//
//  OrderHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Order History Request struct to hold request state and result
struct OrderHistoryRequest: Decodable {
  let success: Bool?
  let message: String?
  let result: [OrderHistory]?
  
  init(success: Bool?, message: String?, result: [OrderHistory]?) {
    self.success = success
    self.message = message
    self.result = result
  }
}

/// The data structure for the result of the Order History Request
struct OrderHistory: Decodable {
  let orderUuid: String?
  let exchange: String?
  let timeStamp: String?
  let orderType: String?
  let limit: Double?
  let quantity: Double?
  let quantityRemaining: Double?
  let commission: Double?
  let price: Double?
  let pricePerUnit: Double?
  let isConditional: Bool?
  let condition: String?
  let conditionTarget: String?
  let immediateOrCancel: Bool?
  
  private enum CodingKeys: String, CodingKey {
    case orderUuid = "OrderUuid"
    case exchange = "Exchange"
    case timeStamp = "TimeStamp"
    case orderType = "OrderType"
    case limit = "Limit"
    case quantity = "Quantity"
    case quantityRemaining = "QuantityRemaining"
    case commission = "Commission"
    case price = "Price"
    case pricePerUnit = "PricePerUnit"
    case isConditional = "IsConditional"
    case condition = "Condition"
    case conditionTarget = "conditionTarget"
    case immediateOrCancel = "ImmediateOrCancel"
  }
}
