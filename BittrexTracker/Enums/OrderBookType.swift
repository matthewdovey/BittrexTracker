//
//  OrderBookType.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 23/03/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// OrderBookType enum to specify the order book to retrieve
///
/// - sell: The sell order book
/// - buy: The buy order book
public enum OrderBookType: String {
  case sell
  case buy
}
