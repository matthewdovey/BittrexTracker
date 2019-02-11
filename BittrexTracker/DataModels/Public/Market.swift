//
//  Market.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Markets Request
public struct Market: Decodable {
  public let baseCurrency: String?
  public let marketCurrencyLong: String?
  public let baseCurrencyLong: String?
  public let minTradeSize: Double?
  public let marketName: String?
  public let isActive: Bool?
  public let created: String?
  
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
