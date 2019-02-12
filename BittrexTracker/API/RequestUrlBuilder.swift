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
  
  // URL constants (market requests)
  private let buyLimitURL = "/market/buylimit"
  private let sellLimitURL = "/market/selllimit"
  private let cancelURL = "/market/cancel"
  private let openOrdersURL = "/market/getopenorders"
  
  // URL constants (account requests)
  private let balancesURL = "/account/getbalances"
  private let balanceURL = "/account/getbalance"
  private let depositAddressUrl = "/account/getDepositAddress"
  private let withdrawURL = "/account/withdraw"
  private let orderURL = "/account/getorder"
  private let orderHistoryURL = "/account/getorderhistory"
  private let depositHistoryURL = "/account/getdeposithistory"
  private let withdrawalHistoryURL = "/account/getwithdrawalhistory"
  
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
  public func buildUrl(for request: Request) -> String {
    switch request {
    case .markets:
      return baseURL+apiVersion+marketsURL
    case .currencies:
      return baseURL+apiVersion+currenciesURL
    case .ticker:
      return baseURL+apiVersion+tickerURL
    case .marketSummaries:
      return baseURL+apiVersion+marketSummariesURL
    case .marketSummary:
      return baseURL+apiVersion+marketSummaryURL
    case .orderBook:
      return baseURL+apiVersion+orderbookURL+marketParam
    case .marketHistory:
      return baseURL+apiVersion+marketHistoryUrl
    case .buyLimit:
      return baseURL+apiVersion+buyLimitURL+apiKeyParam+apiKey+marketParam
    case .sellLimit:
      return baseURL+apiVersion+sellLimitURL+apiKeyParam+apiKey+marketParam
    case .cancel:
      return baseURL+apiVersion+cancelURL+apiKeyParam+apiKey+uuidParam
    case .openOrders:
      return baseURL+apiVersion+openOrdersURL+apiKeyParam+apiKey+marketParam
    case .balances:
      return baseURL+apiVersion+balancesURL+apiKeyParam+apiKey
    case .balance:
      return baseURL+apiVersion+balanceURL+apiKeyParam+apiKey+andCurrencyParam
    case .depositAddress:
      return baseURL+apiVersion+depositAddressUrl+apiKeyParam+apiKey+andCurrencyParam
    case .withdraw:
      return baseURL+apiVersion+withdrawURL+apiKeyParam+apiKey+andCurrencyParam
    case .order:
      return baseURL+apiVersion+orderURL+uuidParam
    case .depositHistory:
      return baseURL+apiVersion+depositHistoryURL+currencyParam
    case .orderHistory:
      return baseURL+apiVersion+orderHistoryURL
    case .withdrawalHistory:
      return baseURL+apiVersion+withdrawalHistoryURL
    }
  }
}
