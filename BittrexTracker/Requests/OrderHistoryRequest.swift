//
//  OrderHistoryRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

struct OrderHistoryRequest: Decodable {
    let success: Bool?
    let message: String?
    let result: [OrderHistoryResult]?
}

struct OrderHistoryResult: Decodable {
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
