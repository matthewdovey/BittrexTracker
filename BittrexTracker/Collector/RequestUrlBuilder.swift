//
//  RequestUrlBuilder.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Class to provide the request URLS for public, account and market requests
final class RequestUrlBuilder {
  
  // Base URL components
  private let baseURL = "https://bittrex.com/api/"
  private let apiVersion = "v1.1"
  
  // URL constants (public requests)
  private let marketsURL = "/public/getmarkets"
  private let currenciesURL = "/public/getcurrencies"
  private let tickerURL = "/public/getticker?market="
  private let marketSummaryURL = "/public/getmarketsummary?market="
  private let marketSummariesURL = "/public/getmarketsummaries"
  private let orderbookURL = "/public/getorderbook"
  private let marketHistoryUrl = "/public/getmarkethistory?market="
  
  // URL constants (account requests)
  private let balanceURL = "/account/getbalance"
  private let balancesURL = "/account/getbalances"
  private let orderHistoryURL = "/account/getorderhistory"
  private let depositHistoryURL = "/account/getdeposithistory"
  private let withdrawalHistoryURL = "/account/getwithdrawalhistory"
  
  // URL constants (market requests)
  private let buyLimitURL = "/market/buylimit"
  private let sellLimitURL = "/market/selllimit"
  private let cancelURL = "/market/cancel"
  private let openOrdersURL = "/market/getopenorders"
  
  // Parameter constants
  private let currencyParam = "?currency="
  private let andCurrencyParam = "&currency="
  private let apiKeyParam = "?apikey="
  private let nonceParam = "&nonce="
  private let apiSecretParam = "&apisecret"
  private let signHeader = "apisign"
  private let marketParam = "?market="
  private let uuidParam = "&uuid="
  
  // Wallet access properties
  private var apiKey: String
  private var apiSecret: String
  private var apiSecretBytes: [UInt8]?
  
  /// Initialiser to set the API key and API secret
  ///
  /// - Parameters:
  ///   - apiKey: The user's API key
  ///   - apiSecret: The user's API secret
  init(key: String = "", secret: String = "") {
    self.apiKey = key
    self.apiSecret = secret
  }
  
  /// API key property setter
  ///
  /// - Parameter apiKey: The API key
  public func setKey(key: String) {
    self.apiKey = key
  }
  
  /// API secret property setter
  ///
  /// - Parameter apiSecret: The API secret
  public func setSecret(secret: String) {
    self.apiSecret = secret
  }
  
  /// Method to take a request URL enum and pass the correlating url string
  ///
  /// - Parameter request: Request URL enum to define the URL to return
  /// - Returns: Request URL to be used with the Bittrex API
  public func buildUrlFor(request: RequestUrl) -> String {
    switch request {
    case .Currencies:
      return baseURL+apiVersion+currenciesURL
    case .Markets:
      return baseURL+apiVersion+marketsURL
    case .MarketSummary:
      return baseURL+apiVersion+marketSummaryURL
    case .MarketSummaries:
      return baseURL+apiVersion+marketSummariesURL
    case .Ticker:
      return baseURL+apiVersion+tickerURL
    case .Balance:
      return baseURL+apiVersion+balanceURL+apiKeyParam+apiKey+andCurrencyParam
    case .Balances:
      return baseURL+apiVersion+balancesURL+apiKeyParam+apiKey
    case .MarketHistory:
      return baseURL+apiVersion+marketHistoryUrl
    case .DepositHistory:
      return baseURL+apiVersion+depositHistoryURL+currencyParam
    case .OrderHistory:
      return baseURL+apiVersion+orderHistoryURL
    case .WithdrawalHistory:
      return baseURL+apiVersion+withdrawalHistoryURL
    case .BuyLimit:
      return baseURL+apiVersion+buyLimitURL+apiKeyParam+apiKey+marketParam
    case .SellLimit:
      return baseURL+apiVersion+sellLimitURL+apiKeyParam+apiKey+marketParam
    case .Cancel:
      return baseURL+apiVersion+cancelURL+apiKeyParam+apiKey+uuidParam
    case .OpenOrders:
      return baseURL+apiVersion+openOrdersURL+apiKeyParam+apiKey+marketParam
    }
  }
}
