//
//  Placeholder.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 13/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Placeholder enum to provide the string placeholder for each type
///
/// - apiKey: The API key placeholder
/// - market: The market value placeholder
/// - quantity: The quantity value placeholder
/// - type: The type value placeholder
/// - rate: The rate value placeholder
/// - uuid: The uuid value placeholder
/// - currency: The currency value placeholder
/// - address: The address value placeholder
/// - paymentid: The payment ID placeholder
enum Placeholder: String {
  case apiKey = "API_KEY"
  case market = "MARKET"
  case quantity = "QUANTITY"
  case type = "TYPE"
  case rate = "RATE"
  case uuid = "UUID"
  case currency = "CURRENCY"
  case address = "ADDRESS"
  case paymentid = "PAYMENT_ID"
}
