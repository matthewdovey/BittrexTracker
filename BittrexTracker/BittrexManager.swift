//
//  BittrexManager.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

private let UNKNOWN_MESSAGE = "unknown"

/// Class to provide access to all Bittrex API wrappers
public final class BittrexManager {

  private let publicApi: PublicAPI
  private let marketApi: MarketAPI
  private let accountApi: AccountAPI
  private let session: URLSession
  private let urlBuilder: RequestUrlBuilder

  /// Initialiser to create all collectors and their required dependencies
  public init(session: URLSession = .shared) {
    self.session = session
    urlBuilder = RequestUrlBuilder()
    publicApi = PublicAPI(session: session, builder: urlBuilder)
    marketApi = MarketAPI(session: session, apiKey: "")
    accountApi = AccountAPI(session: session, apiKey: "", apiSecret: "")
  }

  /// Setter to allow user to add API key
  public func setApiKey(key: String) {
    marketApi.setApiKey(key: key)
  }

  // MARK: Public API calls

  /// Method to return all currencies listed on the exchange
  ///
  /// - Parameter completion: Escaping Outcome object
  public final func getCurrencies(completion: @escaping ((Outcome<[Coin], String>) -> Void)) {
    publicApi.getCurrencies { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }

  /// Method to return all markets for currencies
  ///
  /// - Parameter completion: Escaping Outcome object
  public final func getMarkets(completion: @escaping ((Outcome<[Market], String>) -> Void)) {
    publicApi.getMarkets { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }

  /// Method to return ticker results for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping Outcome object
  public final func getTickerFor(market: String, completion: @escaping ((Outcome<Ticker, String>) -> Void)) {
    publicApi.getTickerFor(market: market, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    })
  }

  /// Method to return all market summaires
  ///
  /// - Parameter completion: Escaping Outcome object
  public final func getMarketSummaries(completion: @escaping ((Outcome<[MarketSummary], String>) -> Void)) {
    publicApi.getMarketSummaries { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }

  /// Method to return a market summary for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping Outcome object
  public final func getSummaryForMarket(market: String, completion: @escaping ((Outcome<[MarketSummary], String>) -> Void)) {
    publicApi.getSummaryForMarket(market: market, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    })
  }

  /// Method to return the order book for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - type: Orderbook type
  ///   - completion: Escaping Outcome object
  public final func getOrderBook(market: String, type: String, completion: @escaping ((Outcome<[OrderBook], String>) -> Void)) {
    publicApi.getOrderBook(market: market, type: type, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    })
  }

  /// Method to retrieve the market history for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping Outcome object
  public final func getMarketHistoryFor(market: String, completion: @escaping ((Outcome<[MarketHistory], String>) -> Void)) {
    publicApi.getMarketHistoryFor(market: market, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    })
  }

  // MARK: Market API calls

  /// Method to place a buy order in a specific market
  ///
  /// - Parameter completion: Escaping Outcome object
  final func getBuyLimit(completion: @escaping ((Outcome<BuyLimit, String>) -> Void)) {
    marketApi.getBuyLimit { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }


  /// Method to place a sell order in a specific market
  ///
  /// - Parameter completion: Escaping Outcome object
  final func getSellLimit(completion: @escaping ((Outcome<SellLimit, String>) -> Void)) {
    marketApi.getSellLimit { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }

  /// Method to cancel a buy or sell order
  ///
  /// - Parameter completion: Escaping Outcome object
  final func cancel(completion: @escaping ((Outcome<Cancel, String>) -> Void)) {
    marketApi.cancel { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }

  /// Method to return all orders that the user has open
  ///
  /// - Parameter completion: Escaping Outcome object
  final func getOpenOrders(completion: @escaping ((Outcome<[OpenOrders], String>) -> Void)) {
    marketApi.getOpenOrders { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }
  
  // MARK: Account API calls
  
  final func getBalanceFor(currency: String, completion: @escaping ((Outcome<Balance, String>) -> Void)) {
    accountApi.getBalanceFor(currency: currency) { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }
  
  final func getBalances(completion: @escaping ((Outcome<[Balance], String>) -> Void)) {
    accountApi.getBalances { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }
  
  final func getDepositAddress(currency: String, completion: @escaping ((Outcome<[DepositAddress], String>) -> Void)) {
    accountApi.getDepositAddress(currency: currency) { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }
  
  final func withdraw(currency: String,
                      quantity: Float,
                      address: String,
                      completion: @escaping ((Outcome<Withdraw, String>) -> Void)) {
    accountApi.withdraw(currency: currency,
                        quantity: quantity,
                        address: address)
    { (request) in
      if request.success == true, let data = request.result {
        completion(.success(data: data))
      } else {
        let message = request.message ?? UNKNOWN_MESSAGE
        completion(.failure(error: message))
      }
    }
  }
}
