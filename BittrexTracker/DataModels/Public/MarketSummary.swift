//
//  MarketSummary.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Market Summary Request
public struct MarketSummary: Decodable {
  /// The market name.
  public let marketName: String?
  /// The 24 hour high.
  public let high: Double?
  /// The 24 hour low.
  public let low: Double?
  /// The current volume.
  public let volume: Double?
  /// The value of the last sale.
  public let last: Double?
  /// The base volume.
  public let baseVolume: Double?
  /// The timestamp of the last sale.
  public let timeStamp: String?
  /// The current bid price.
  public let bid: Double?
  /// The current ask price.
  public let ask: Double?
  /// The number of open buy orders.
  public let openBuyOrders: Int?
  /// The number of open sell orders.
  public let openSellOrders: Int?
  /// The previous day 24 hour high.
  public let prevDay: Double?
  /// The date of the markets creation.
  public let created: String?
  
  /// Initialises a new MarketSummary object.
  ///
  /// - Parameters:
  ///   - marketName: The market name.
  ///   - high: The 24 hour high.
  ///   - low: The 24 hour low.
  ///   - volume: The current volume.
  ///   - last: The value of the last sale.
  ///   - baseVolume: The base volume
  ///   - timeStamp: The timestamp of the last sale.
  ///   - bid: The current bid price.
  ///   - ask: The current ask price.
  ///   - openBuyOrders: The number of open buy orders.
  ///   - openSellOrders: The number of open sell orders.
  ///   - prevDay: The previous day 24 hour high.
  ///   - created: The date of the markets creation.
  public init(
    marketName: String?,
    high: Double?,
    low: Double?,
    volume: Double?,
    last: Double?,
    baseVolume: Double?,
    timeStamp: String?,
    bid: Double?,
    ask: Double?,
    openBuyOrders: Int?,
    openSellOrders: Int?,
    prevDay: Double?,
    created: String?
    ) {
    self.marketName = marketName
    self.high = high
    self.low = low
    self.volume = volume
    self.last = last
    self.baseVolume = baseVolume
    self.timeStamp = timeStamp
    self.bid = bid
    self.ask = ask
    self.openBuyOrders = openBuyOrders
    self.openSellOrders = openSellOrders
    self.prevDay = prevDay
    self.created = created
  }
  
  private enum CodingKeys: String, CodingKey {
    case marketName = "MarketName"
    case high = "High"
    case low = "Low"
    case volume = "Volume"
    case last = "Last"
    case baseVolume = "BaseVolume"
    case timeStamp = "TimeStamp"
    case bid = "Bid"
    case ask = "Ask"
    case openBuyOrders = "OpenBuyOrders"
    case openSellOrders = "OpenSellOrders"
    case prevDay = "PrevDay"
    case created = "Created"
  }
}
