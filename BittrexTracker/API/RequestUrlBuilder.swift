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
  private let tickerURL = "/public/getticker?market=MARKET"
  private let marketSummaryURL = "/public/getmarketsummary?market=MARKET"
  private let marketSummariesURL = "/public/getmarketsummaries"
  private let orderbookURL = "/public/getorderbook?market=MARKET&type=TYPE"
  private let marketHistoryUrl = "/public/getmarkethistory?market=MARKET"
  
  // URL constants (market requests)
  private let buyLimitURL = "/market/buylimit?apikey=API_KEY&market=MARKET&quantity=QUANTITY&rate=RATE"
  private let sellLimitURL = "/market/selllimit?apikey=API_KEY&market=MARKET&quantity=QUANTITY&rate=RATE"
  private let cancelURL = "/market/cancel?apikey=API_KEY&uuid=UUID"
  private let openOrdersURL = "/market/getopenorders?apikey=API_KEY&market=MARKET"
  
  // URL constants (account requests)
  private let balancesURL = "/account/getbalances?apikey=API_KEY"
  private let balanceURL = "/account/getbalance?apikey=API_KEY&currency=CURRENCY"
  private let depositAddressUrl = "/account/getdepositaddress?apikey=API_KEY&currency=CURRENCY"
  private let withdrawURL = "/account/withdraw?apikey=API_KEY&currency=CURRENCY&quantity=QUANTITY&address=ADDRESS"
  private let orderURL = "/account/getorder&uuid=UUID"
  private let orderHistoryURL = "/account/getorderhistory"
  private let orderHistoryForURL = "/account/getorderhistory?market=MARKET"
  private let withdrawalHistoryURL = "/account/getwithdrawalhistory"
  private let withdrawalHistoryForURL = "/account/getwithdrawalhistory?currency=CURRENCY"
  private let depositHistoryURL = "/account/getdeposithistory"
  private let depositHistoryForURL = "/account/getdeposithistory?currency=CURRENCY"
  
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
  func setKey(key: String) {
    self.apiKey = key
  }
  
  /// API secret property setter
  ///
  /// - Parameter apiSecret: The API secret
  func setSecret(secret: String) {
    self.apiSecret = secret
  }

  /// Method to take a request URL enum and pass the correlating url string
  ///
  /// - Parameters:
  ///   - request: Request URL enum to define the URL to return
  ///   - withParameters: The parameters to replace with URL placeholders
  /// - Returns: Request URL to be used with the Bittrex API
  func buildUrl(for request: Request, withParameters parameters: [Placeholder : String]) -> String {
    switch request {
    case .markets:
      let url = baseURL+apiVersion+marketsURL
      return replacePlaceholders(for: url, with: parameters)
    case .currencies:
      let url = baseURL+apiVersion+currenciesURL
      return replacePlaceholders(for: url, with: parameters)
    case .ticker:
      let url = baseURL+apiVersion+tickerURL
      return replacePlaceholders(for: url, with: parameters)
    case .marketSummaries:
      let url = baseURL+apiVersion+marketSummariesURL
      return replacePlaceholders(for: url, with: parameters)
    case .marketSummary:
      let url = baseURL+apiVersion+marketSummaryURL
      return replacePlaceholders(for: url, with: parameters)
    case .orderBook:
      let url = baseURL+apiVersion+orderbookURL
      return replacePlaceholders(for: url, with: parameters)
    case .marketHistory:
      let url = baseURL+apiVersion+marketHistoryUrl
      return replacePlaceholders(for: url, with: parameters)
    case .buyLimit:
      let url = baseURL+apiVersion+buyLimitURL
      return replacePlaceholders(for: url, with: parameters)
    case .sellLimit:
      let url = baseURL+apiVersion+sellLimitURL
      return replacePlaceholders(for: url, with: parameters)
    case .cancel:
      let url = baseURL+apiVersion+cancelURL
      return replacePlaceholders(for: url, with: parameters)
    case .openOrders:
      let url = baseURL+apiVersion+openOrdersURL
      return replacePlaceholders(for: url, with: parameters)
    case .balances:
      let url = baseURL+apiVersion+balancesURL
      return replacePlaceholders(for: url, with: parameters)
    case .balance:
      let url = baseURL+apiVersion+balanceURL
      return replacePlaceholders(for: url, with: parameters)
    case .depositAddress:
      let url = baseURL+apiVersion+depositAddressUrl
      return replacePlaceholders(for: url, with: parameters)
    case .withdraw:
      let url = baseURL+apiVersion+withdrawURL
      return replacePlaceholders(for: url, with: parameters)
    case .order:
      let url = baseURL+apiVersion+orderURL
      return replacePlaceholders(for: url, with: parameters)
    case .depositHistories:
      let url = baseURL+apiVersion+depositHistoryURL
      return replacePlaceholders(for: url, with: parameters)
    case .depositHistory:
      let url = baseURL+apiVersion+depositHistoryForURL
      return replacePlaceholders(for: url, with: parameters)
    case .orderHistory:
      let url = baseURL+apiVersion+orderHistoryURL
      return replacePlaceholders(for: url, with: parameters)
    case .withdrawalHistories:
      let url = baseURL+apiVersion+withdrawalHistoryURL
      return replacePlaceholders(for: url, with: parameters)
    case .withdrawalHistory:
      let url = baseURL+apiVersion+withdrawalHistoryForURL
      return replacePlaceholders(for: url, with: parameters)
    }
  }

  private func replacePlaceholders(for url: String, with parameters: [Placeholder : String]) -> String {
    var finalisedURL = url
    parameters.forEach { parameter in
      finalisedURL = finalisedURL.replacingOccurrences(of: parameter.key.rawValue, with: parameter.value)
    }
    return finalisedURL
  }
}
