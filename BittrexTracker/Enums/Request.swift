//
//  Request.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Request URL enum to allow for easier selection of required URL
///
/// - Markets: The markets request URL
/// - Currencies: The currencies request URL
/// - Ticker: The ticker request URL
/// - MarketSummaries: The market summaries request URL
/// - MarketSummary: The market summary request URL
/// - OrderBook: The order book request URL
/// - MarketHistory: The market history request URL
/// - BuyLimit: The buy limit request URL
/// - SellLimit: The sell limit request URL
/// - Cancel: The cancel request URL
/// - OpenOrders: The open orders request URL
/// - Balances: The balances request URL
/// - Balance: The balance request URL
/// - DepositAddress: The deposit address request URL
/// - Withdraw: The withdraw request URL
/// - Order: The order request URL
/// - OrderHistory: The order history request URL
/// - WithdrawalHistories: The withdrawal histories request URL.
/// - WithdrawalHistory: The withdrawal history request URL
/// - DepositHistories: The deposit histories request URL
/// - DepositHistory: The deposit history request URL
enum Request {
  case markets
  case currencies
  case ticker
  case marketSummaries
  case marketSummary
  case orderBook
  case marketHistory
  case buyLimit
  case sellLimit
  case cancel
  case openOrders
  case balances
  case balance
  case depositAddress
  case withdraw
  case order
  case orderHistory
  case withdrawalHistories
  case withdrawalHistory
  case depositHistories
  case depositHistory
}
