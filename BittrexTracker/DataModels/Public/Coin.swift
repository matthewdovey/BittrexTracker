//
//  Coin.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Coin Request
public struct Coin: Decodable {
  public let currency: String?
  public let currencyLong: String?
  public let minConfirmation: Int64?
  public let txFee: Double?
  public let isActive: Bool?
  public let coinType: String?
  public let baseAddress: String?
  public var bittrexSummary: MarketSummary?
  
  private enum CodingKeys: String, CodingKey {
    case currency = "Currency"
    case currencyLong = "CurrencyLong"
    case minConfirmation = "MinConfirmation"
    case txFee = "TxFee"
    case isActive = "IsActive"
    case coinType = "CoinType"
    case baseAddress = "BaseAddress"
    case bittrexSummary = "BittrexSummary"
  }
}
