//
//  BuyLimit.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Buy Limit Request
public struct BuyLimit: Decodable {
  public let uuid: String?
  
  private enum CodingKeys: String, CodingKey {
    case uuid = "UUID"
  }
}
