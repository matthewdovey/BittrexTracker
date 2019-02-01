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
/// - WithdrawalHistory: The withdrawal history request URL
/// - DepositHistory: The deposit history request URL
enum RequestUrl {
  case Markets
  case Currencies
  case Ticker
  case MarketSummaries
  case MarketSummary
  case OrderBook
  case MarketHistory
  case BuyLimit
  case SellLimit
  case Cancel
  case OpenOrders
  case Balances
  case Balance
  case DepositAddress
  case Withdraw
  case Order
  case OrderHistory
  case WithdrawalHistory
  case DepositHistory
}
