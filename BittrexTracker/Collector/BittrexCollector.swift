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
    
    private let session: URLSession
    private let apiKey: String
    private let apiSecret: String
    private var apiSecretBytes: [UInt8]?
    
    
    /// Initialiser to create the bittrex collector
    ///
    /// - Parameters:
    ///   - session: URLSession
    ///   - apiKey:
    ///   - apiSecret:
    init(session: URLSession = .shared, apiKey: String, apiSecret: String) {
        self.session = session
        self.apiKey = apiKey
        self.apiSecret = apiSecret
    }
    
    /// Method to return all currencies listed on the exchange
    ///
    /// - Parameter completion:
    final func getCurrencies(completion: @escaping ((CoinRequest) -> Void)) {
        let url = URL(string: baseURL+apiVersion+currenciesURL)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error encountered when getting currencies: \(String(describing: error))")
            } else {
                if (data != nil) {
                    do {
                        let coins = try JSONDecoder().decode(CoinRequest.self, from: data!)
                        completion(coins)
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
    /// - Parameter completion:
    final func getMarkets(completion: @escaping ((MarketsRequest) -> Void)) {
        let url = URL(string: baseURL+apiVersion+marketsURL)
        let task = session.dataTask(with: url!) { (data, response, error) in
            print(data)
            if error != nil {
                print("Error encountered when getting markets: \(String(describing: error))")
            } else {
                if (data != nil) {
                    do {
                        let markets = try JSONDecoder().decode(MarketsRequest.self, from: data!)
                        completion(markets)
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
    ///   - market:
    ///   - completion:
    final func getTickerFor(market: String, completion: @escaping ((TickerResult) -> Void)) {
        let url = URL(string: baseURL+apiVersion+tickerURL+market)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error encountered when getting ticker: \(String(describing: error))")
            } else {
                if (data != nil) {
                    do {
                        let ticker = try JSONDecoder().decode(TickerResult.self, from: data!)
                        completion(ticker)
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
    /// - Parameter completion:
    final func getMarketSummaries(completion: @escaping ((MarketSummaryRequest) -> Void)) {
        let url = URL(string: baseURL+apiVersion+marketSummariesURL)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Market Summaries Response: \(response.statusCode)")
            }
            if error != nil {
                print("Error encountered when getting market summaries: \(String(describing: error))")
            } else {
                if data != nil {
                    do {
                        let summaries = try JSONDecoder().decode(MarketSummaryRequest.self, from: data!)
                        completion(summaries)
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
    ///   - market:
    ///   - completion:
    final func getSummaryForMarket(market: String, completion: @escaping ((MarketSummaryRequest) -> Void)) {
        let url = URL(string: baseURL+apiVersion+marketSummaryURL+market)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error encountered when getting summary for market: \(String(describing: error))")
            } else {
                if data != nil {
                    do {
                        let summary = try JSONDecoder().decode(MarketSummaryRequest.self, from: data!)
                        completion(summary)
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
    ///   - market:
    ///   - completion:
    final func getMarketHistoryFor(market: String, completion: @escaping ((MarketHistoryRequest) -> Void)) {
        let url = URL(string: baseURL+apiVersion+marketHistoryUrl+market)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error encountered when getting market history: \(String(describing: error))")
            } else {
                if data != nil {
                    do {
                        let history = try JSONDecoder().decode(MarketHistoryRequest.self, from: data!)
                        completion(history)
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
    ///   - apiKey:
    ///   - completion:
    final func getBalances(apiKey: String, completion: @escaping ((BalanceRequest) -> Void)) {
        let url = URL(string: baseURL+apiVersion+balancesURL+apiKey)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error encountered when getting balances: \(String(describing: error))")
            } else {
                if data != nil {
                    do {
                        let balances = try JSONDecoder().decode(BalanceRequest.self, from: data!)
                        completion(balances)
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
    ///   - apiKey:
    ///   - currency:
    ///   - completion:
    final func getBalanceFor(apiKey: String, currency: String, completion: @escaping ((BalanceResult) -> Void)) {
        let url = URL(string: baseURL+apiVersion+balancesURL+currency)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error encountered when getting balance: \(String(describing: error))")
            } else {
                if data != nil {
                    do {
                        let balance = try JSONDecoder().decode(BalanceResult.self, from: data!)
                        completion(balance)
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
        task.resume()
    }
}
