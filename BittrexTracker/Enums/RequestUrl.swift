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
/// - Currencies: the currencies request url
/// - Markets: the markets request url
/// - MarketSummaries: the market summaries request url
/// - Ticker: the ticker request url
/// - MarketSummary: the market summary request url
/// - MarketHistory: the market history request url
/// - Balance: the balance request url
/// - Balances: the balances request url
/// - OrderHistory: the order history request url
/// - WithdrawalHistory: the withdrawal history request url
/// - DepositHistory: the deposit history request url
enum RequestUrl {
  case Currencies
  case Markets
  case MarketSummaries
  case Ticker
  case MarketSummary
  case MarketHistory
  case Balance
  case Balances
  case OrderHistory
  case WithdrawalHistory
  case DepositHistory
}
