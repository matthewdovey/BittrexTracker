//
//  Balance.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Balance Request
public struct Balance: Decodable {
  public let currency: String?
  public let balance: Double?
  public let available: Double?
  public let pending: Double?
  public let cryptoAddress: String?
  public let requested: Bool?
  public let uuid: String?
  
  private enum CodingKeys: String, CodingKey {
    case currency = "Currency"
    case balance = "Balance"
    case available = "Available"
    case pending = "Pending"
    case cryptoAddress = "CryptoAddress"
    case requested = "Requested"
    case uuid = "UUID"
  }
}
