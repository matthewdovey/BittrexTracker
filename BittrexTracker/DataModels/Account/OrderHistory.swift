//
//  OrderHistory.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Order History Request
public struct OrderHistory: Decodable {
  public let orderUuid: String?
  public let exchange: String?
  public let timeStamp: String?
  public let orderType: String?
  public let limit: Double?
  public let quantity: Double?
  public let quantityRemaining: Double?
  public let commission: Double?
  public let price: Double?
  public let pricePerUnit: Double?
  public let isConditional: Bool?
  public let condition: String?
  public let conditionTarget: String?
  public let immediateOrCancel: Bool?
  
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
