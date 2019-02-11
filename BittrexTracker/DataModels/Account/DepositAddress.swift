//
//  DepositAddress.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the result of the Deposit Address Request
public struct DepositAddress: Decodable {
  public let currency: String?
  public let address: String?
  
  private enum CodingKeys: String, CodingKey {
    case currency = "Currency"
    case address = "Address"
  }
}
