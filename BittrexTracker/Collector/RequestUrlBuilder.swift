//
//  RequestUrlBuilder.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// A class to provide the request urls
final class RequestUrlBuilder {
  
  // URL constants (public requests)
  private let baseURL = "https://bittrex.com/api/"
  private let apiVersion = "v1.1"
  private let marketsURL = "/public/getmarkets"
  private let currenciesURL = "/public/getcurrencies"
  private let marketSummariesURL = "/public/getmarketsummaries"
  private let tickerURL = "/public/getticker?market="
  private let marketSummaryURL = "/public/getmarketsummary?market="
  private let marketHistoryUrl = "/public/getmarkethistory?market="
  
  // URL constants (account requests)
  private let balanceURL = "/account/getbalance"
  private let balancesURL = "/account/getbalances"
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
  
  // Wallet access properties
  private var apiKey: String
  private var apiSecret: String
  private var apiSecretBytes: [UInt8]?
  
  // TODO: finish description for api secret docs
  /// Initialiser to set the API key and API secret
  ///
  /// - Parameters:
  ///   - apiKey: the api key for the user's wallet
  ///   - apiSecret:
  init(key: String = "", secret: String = "") {
    self.apiKey = key
    self.apiSecret = secret
  }
  
  /// API key property setter
  ///
  /// - Parameter apiKey: the API key
  public func setKey(key: String) {
    self.apiKey = key
  }
  
  /// API secret property setter
  ///
  /// - Parameter apiSecret: the API secret
  public func setSecret(secret: String) {
    self.apiSecret = secret
  }
  
  /// Method to take a request URL enum and pass the correlating url string
  ///
  /// - Parameter request: a request URL enum to define the url to return
  /// - Returns: a request url to be used with the Bittrex API
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
    }
  }
}
