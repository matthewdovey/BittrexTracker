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
  let uuid: String?
  let orderUuid: String?
  let exchange: String?
  let orderType: String?
  let quantity: Float?
  let quantityRemaining: Float?
  let limit: Float?
  let commissionPaid: Float?
  let price: Float?
  let pricePerUnit: Float?
  let opened: String?
  let closed: String?
  let cancelInitiated: String?
  let immediateOrCancel: String?
  let isConditional: String?
  
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
