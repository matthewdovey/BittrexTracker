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
  let currency: String?
  let currencyLong: String?
  let minConfirmation: Int64?
  let txFee: Double?
  let isActive: Bool?
  let coinType: String?
  let baseAddress: String?
  var bittrexSummary: MarketSummary?
  
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
