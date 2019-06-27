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
  /// The short name of the currency.
  public let currency: String?
  /// The long name of the currency.
  public let currencyLong: String?
  /// The minimum confirmation.
  public let minConfirmation: Int64?
  /// The transaction fee.
  public let txFee: Double?
  /// Whether or not the currency is active.
  public let isActive: Bool?
  /// The coin type of the currency.
  public let coinType: String?
  /// The base address of the currency.
  public let baseAddress: String?
  /// The market summary for the currency.
  public var marketSummary: MarketSummary?
  
  /// Initialises a new Coin object.
  ///
  /// - Parameters:
  ///   - currency: The short name of the currency.
  ///   - currencyLong: The long name of the currency.
  ///   - minConfirmation: The minimum confirmation.
  ///   - txFee: The transaction fee.
  ///   - isActive: Whether or not the currency is active.
  ///   - coinType: The type of coin.
  ///   - baseAddress: The base address of the coin.
  ///   - marketSummary: The market summary of the coin.
  public init(
    currency: String?,
    currencyLong: String?,
    minConfirmation: Int64?,
    txFee: Double?,
    isActive: Bool?,
    coinType: String?,
    baseAddress: String?,
    marketSummary: MarketSummary?
    ) {
    self.currency = currency
    self.currencyLong = currencyLong
    self.minConfirmation = minConfirmation
    self.txFee = txFee
    self.isActive = isActive
    self.coinType = coinType
    self.baseAddress = baseAddress
    self.marketSummary = marketSummary
  }
  
  private enum CodingKeys: String, CodingKey {
    case currency = "Currency"
    case currencyLong = "CurrencyLong"
    case minConfirmation = "MinConfirmation"
    case txFee = "TxFee"
    case isActive = "IsActive"
    case coinType = "CoinType"
    case baseAddress = "BaseAddress"
    case marketSummary = "MarketSummary"
  }
}
