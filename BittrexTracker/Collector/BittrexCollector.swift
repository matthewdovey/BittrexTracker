//
//  BittrexCollector.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation


/// A class to provide a wrapper around the Bittrex Exchange APIs
final class BittrexCollector {
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
  private let balancesURL = "/account/getbalances"
  private let orderHistoryURL = "/account/getorderhistory"
  private let depositHistoryURL = "/account/getdeposithistory"
  private let withdrawalHistoryURL = "/account/getwithdrawalhistory"
  private let balanceURL = "/account/getbalance?currency="
  
  // Parameter constants
  private let apiKeyParam = "?apikey="
  private let nonceParam = "&nonce="
  private let apiSecretParam = "&apisecret"
  private let signHeader = "apisign"
  
  private var session: URLSession
  private var apiKey: String
  private var apiSecret: String
  private var apiSecretBytes: [UInt8]?
  
  /// shared singleton instance of the Bittrex collector class
  static var api: BittrexCollector = {
    let instance = BittrexCollector()
    instance.session = URLSession.shared
    return instance
  }()
  
  /// Initialiser to create the bittrex collector
  ///
  /// - Parameters:
  ///   - session: URLSession
  ///   - apiKey:
  ///   - apiSecret:
  init(session: URLSession = .shared, apiKey: String = "", apiSecret: String = "") {
    self.session = session
    self.apiKey = apiKey
    self.apiSecret = apiSecret
  }
  
  /// API key property setter
  ///
  /// - Parameter apiKey: the API key
  public func setApiKey(apiKey: String) {
    self.apiKey = apiKey
  }
  
  /// API secret property setter
  ///
  /// - Parameter apiSecret: the API secret
  public func setApiSecret(apiSecret: String) {
    self.apiSecret = apiSecret
  }
  
  // MARK: public requests
  
  /// Method to return all currencies listed on the exchange
  ///
  /// - Parameter completion: optionally returning a CoinRequest object and an error
  final func getCurrencies(completion: @escaping ((CoinRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+currenciesURL)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("Error encountered when getting currencies: \(String(describing: error))")
        completion(nil, error)
      } else {
        if (data != nil) {
          do {
            let coins = try JSONDecoder().decode(CoinRequest.self, from: data!)
            completion(coins, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
  
  /// Method to return all markets for currencies
  ///
  /// - Parameter completion: optionally returning a MarketRequest object and an Error
  final func getMarkets(completion: @escaping ((MarketsRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+marketsURL)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("Error encountered when getting markets: \(String(describing: error))")
        completion(nil, error)
      } else {
        if (data != nil) {
          do {
            let markets = try JSONDecoder().decode(MarketsRequest.self, from: data!)
            completion(markets, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
  
  /// Method to return ticker results for a specified currency
  ///
  /// - Parameters:
  ///   - market: the market to retreive data for
  ///   - completion: optionally returning a TickerRequest object and an Error
  final func getTickerFor(market: String, completion: @escaping ((TickerRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+tickerURL+market)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("Error encountered when getting ticker: \(String(describing: error))")
        completion(nil, error)
      } else {
        if (data != nil) {
          do {
            let ticker = try JSONDecoder().decode(TickerRequest.self, from: data!)
            completion(ticker, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
  
  /// Method to return all market summaires
  ///
  /// - Parameter completion: optionally returning a MarkertSummaryRequest and an error
  final func getMarketSummaries(completion: @escaping ((MarketSummaryRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+marketSummariesURL)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if let response = response as? HTTPURLResponse {
        print("Market Summaries Response: \(response.statusCode)")
      }
      if error != nil {
        print("Error encountered when getting market summaries: \(String(describing: error))")
        completion(nil, error)
      } else {
        if data != nil {
          do {
            let summaries = try JSONDecoder().decode(MarketSummaryRequest.self, from: data!)
            completion(summaries, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
  
  /// Method to return a market summary for a specified currency
  ///
  /// - Parameters:
  ///   - market: the summary for a specific market
  ///   - completion: optionally returning a MarketSummaryRequest object and an error
  final func getSummaryForMarket(market: String, completion: @escaping ((MarketSummaryRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+marketSummaryURL+market)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("Error encountered when getting summary for market: \(String(describing: error))")
        completion(nil, error)
      } else {
        if data != nil {
          do {
            let summary = try JSONDecoder().decode(MarketSummaryRequest.self, from: data!)
            completion(summary, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
  
  /// Method to retrieve the market history for a specified currency
  ///
  /// - Parameters:
  ///   - market: the history for a specific market
  ///   - completion: optionally returning a MarketHistoryRequest object and an error
  final func getMarketHistoryFor(market: String, completion: @escaping ((MarketHistoryRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+marketHistoryUrl+market)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("Error encountered when getting market history: \(String(describing: error))")
        completion(nil, error)
      } else {
        if data != nil {
          do {
            let history = try JSONDecoder().decode(MarketHistoryRequest.self, from: data!)
            completion(history, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
  
  /// Method to retrieve all balances for the users wallet
  ///
  /// - Parameters:
  ///   - apiKey: the API key for the user's wallet
  ///   - completion: optionally returning a BalanceRequest and an error
  final func getBalances(apiKey: String, completion: @escaping ((BalanceRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+balancesURL+apiKeyParam+apiKey)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("Error encountered when getting balances: \(String(describing: error))")
        completion(nil, error)
      } else {
        if data != nil {
          do {
            let balances = try JSONDecoder().decode(BalanceRequest.self, from: data!)
            completion(balances, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
  
  /// Method to retrieve the balance of a specified currency from the user's wallet
  ///
  /// - Parameters:
  ///   - apiKey: the API key for the user's wallet
  ///   - currency: the balance for a specific currency
  ///   - completion: optionally returning a BalanceRequest object and an error
  final func getBalanceFor(apiKey: String, currency: String, completion: @escaping ((BalanceRequest?, Error?) -> Void)) {
    let url = URL(string: baseURL+apiVersion+balancesURL+currency)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("Error encountered when getting balance: \(String(describing: error))")
        completion(nil, error)
      } else {
        if data != nil {
          do {
            let balance = try JSONDecoder().decode(BalanceRequest.self, from: data!)
            completion(balance, error)
          } catch {
            print("Error decoding JSON: \(error)")
          }
        }
      }
    }
    task.resume()
  }
}
