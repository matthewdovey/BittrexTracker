//
//  MarketRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Markets Request
struct Market: Decodable {
  let baseCurrency: String?
  let marketCurrencyLong: String?
  let baseCurrencyLong: String?
  let minTradeSize: Double?
  let marketName: String?
  let isActive: Bool?
  let created: String?
  
  private enum CodingKeys : String, CodingKey {
    case baseCurrency = "BaseCurrency"
    case marketCurrencyLong = "MarketCurrencyLong"
    case baseCurrencyLong = "BaseCurrencyLong"
    case minTradeSize = "MinTradeSize"
    case marketName = "MarketName"
    case isActive = "IsActive"
    case created = "Created"
  }
}