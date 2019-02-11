//
//  OpenOrders.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the results of the Open Orders Request
struct OpenOrders: Decodable {
  public let uuid: String?
  public let orderUuid: String?
  public let exchange: String?
  public let orderType: String?
  public let quantity: Float?
  public let quantityRemaining: Float?
  public let limit: Float?
  public let commissionPaid: Float?
  public let price: Float?
  public let pricePerUnit: Float?
  public let opened: String?
  public let closed: String?
  public let cancelInitiated: String?
  public let immediateOrCancel: String?
  public let isConditional: String?
  
  private enum CodingKeys: String, CodingKey {
    case uuid = "UUID"
    case orderUuid = "OrderUUID"
    case exchange = "Exchange"
    case orderType = "OrderType"
    case quantity = "Quantity"
    case quantityRemaining = "QuantityRemaining"
    case limit = "Limit"
    case commissionPaid = "CommissionPaid"
    case price = "Price"
    case pricePerUnit = "PricePerUnit"
    case opened = "Opened"
    case closed = "Closed"
    case cancelInitiated = "CancelInitiated"
    case immediateOrCancel = "ImmediateOrCancel"
    case isConditional = "IsConditional"
  }
}
