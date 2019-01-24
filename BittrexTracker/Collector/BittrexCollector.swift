//
//  BittrexCollector.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 21/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

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
  
  static var api: BittrexCollector = {
    let instance = BittrexCollector()
    instance.session = URLSession.shared
    return instance
  }()
  
  init(session: URLSession = .shared, apiKey: String = "", apiSecret: String = "") {
    self.session = session
    self.apiKey = apiKey
    self.apiSecret = apiSecret
  }
  
  public func setApiKey(apiKey: String) {
    self.apiKey = apiKey
  }
  
  public func setApiSecret(apiSecret: String) {
    self.apiSecret = apiSecret
  }
  
  // Public requests
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
  
  // Account requests
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
