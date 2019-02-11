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
  public let marketName: String?
  public let high: Double?
  public let low: Double?
  public let volume: Double?
  public let last: Double?
  public let baseVolume: Double?
  public let timeStamp: String?
  public let bid: Double?
  public let ask: Double?
  public let openBuyOrders: Int?
  public let openSellOrders: Int?
  public let prevDay: Double?
  public let created: String?
  
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
