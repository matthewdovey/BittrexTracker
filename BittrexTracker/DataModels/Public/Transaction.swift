//
//  Transaction.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 22/03/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

public struct Transaction: Decodable {
  public let quantity: Float?
  public let rate: Float?
  
  private enum CodingKeys: String, CodingKey {
    case quantity = "quantity"
    case rate = "rate"
  }
}
