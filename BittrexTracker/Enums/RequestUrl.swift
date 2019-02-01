//
//  RequestUrl.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Request URL enum to allow for easier selection of required URL
///
/// - Currencies: The currencies request URL
/// - Markets: The markets request URL
/// - MarketSummaries: The market summaries request URL
/// - Ticker: The ticker request URL
/// - MarketSummary: The market summary request URL
/// - MarketHistory: The market history request URL
/// - OrderBook: The order book request URL
/// - Balance: The balance request URL
/// - Balances: The balances request URL
/// - DepositAddress: The deposit address request URL
/// - OrderHistory: The order history request URL
/// - WithdrawalHistory: The withdrawal history request URL
/// - DepositHistory: The deposit history request URL
/// - BuyLimit: The buy limit request URL
/// - SellLimit: The sell limit request URL
/// - Cancel: The cancel request URL
/// - OpenOrders: The open orders request URL
enum RequestUrl {
  case Currencies
  case Markets
  case MarketSummaries
  case Ticker
  case MarketSummary
  case MarketHistory
  case OrderBook
  case Balance
  case Balances
  case DepositAddress
  case OrderHistory
  case WithdrawalHistory
  case DepositHistory
  case BuyLimit
  case SellLimit
  case Cancel
  case OpenOrders
}
