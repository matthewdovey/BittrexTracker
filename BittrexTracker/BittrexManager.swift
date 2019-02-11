//
//  BittrexManager.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Class to provide access to all Bittrex API wrappers
final class BittrexManager {

  private let publicApi: PublicAPI
  private let marketApi: MarketAPI
  private let session: URLSession
  private let urlBuilder: RequestUrlBuilder

  /// Initialiser to create all collectors and their required dependencies
  public init() {
    session = URLSession.shared
    urlBuilder = RequestUrlBuilder()
    publicApi = PublicAPI(session: session, builder: urlBuilder)
    marketApi = MarketAPI(session: session, apiKey: "")
  }

  /// Setter to allow user to add API key
  public func setApiKey(key: String) {
    marketApi.setApiKey(key: key)
  }

  // MARK: Public API calls

  /// Method to return all currencies listed on the exchange
  ///
  /// - Parameter completion: Escaping CoinResult object
  public final func getCurrencies(completion: @escaping ((CoinResult) -> Void)) {
    publicApi.getCurrencies { (request) in
      if request.success == true, let data = request.result {
        completion(CoinResult(outcome: .success, data: data))
      } else {
        let message = request.message ?? "unknown"
        completion(CoinResult(outcome: .failure(message), data: []))
      }
    }
  }

  /// Method to return all markets for currencies
  ///
  /// - Parameter completion: Escaping MarketsResult object
  public final func getMarkets(completion: @escaping ((MarketResult) -> Void)) {
    publicApi.getMarkets { (request) in
      if request.success == true, let data = request.result {
        completion(MarketResult(outcome: .success, data: data))
      } else {
        let message = request.message ?? "unknown"
        completion(MarketResult(outcome: .failure(message), data: []))
      }
    }
  }

  /// Method to return ticker results for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping TickerResult object
  public final func getTickerFor(market: String, completion: @escaping ((TickerResult) -> Void)) {
    publicApi.getTickerFor(market: market, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(TickerResult(outcome: .success, data: [data]))
      } else {
        let message = request.message ?? "unknown"
        completion(TickerResult(outcome: .failure(message), data: []))
      }
    })
  }

  /// Method to return all market summaires
  ///
  /// - Parameter completion: Escaping MarketSummaryResult object
  public final func getMarketSummaries(completion: @escaping ((MarketSummaryResult) -> Void)) {
    publicApi.getMarketSummaries { (request) in
      if request.success == true, let data = request.result {
        completion(MarketSummaryResult(outcome: .success, data: data))
      } else {
        let message = request.message ?? "unknown"
        completion(MarketSummaryResult(outcome: .failure(message), data: []))
      }
    }
  }

  /// Method to return a market summary for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping MarketSummaryResult object
  public final func getSummaryForMarket(market: String, completion: @escaping ((MarketSummaryResult) -> Void)) {
    publicApi.getSummaryForMarket(market: market, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(MarketSummaryResult(outcome: .success, data: data))
      } else {
        let message = request.message ?? "unknown"
        completion(MarketSummaryResult(outcome: .failure(message), data: []))
      }
    })
  }

  /// Method to return the order book for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - type: Orderbook type
  ///   - completion: Escaping OrderBookResult object
  public final func getOrderBook(market: String, type: String, completion: @escaping ((OrderBookResult) -> Void)) {
    publicApi.getOrderBook(market: market, type: type, completion: { (request) in
      // TODO: setup order book request object to have a result property
      if request.success == true/*, let data = request.result*/ {
        completion(OrderBookResult(outcome: .success, data: []))
      } else {
        let message = request.message ?? "unknown"
        completion(OrderBookResult(outcome: .failure(message), data: []))
      }
    })
  }

  /// Method to retrieve the market history for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping MarketHistoryResult object
  public final func getMarketHistoryFor(market: String, completion: @escaping ((MarketHistoryResult) -> Void)) {
    publicApi.getMarketHistoryFor(market: market, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(MarketHistoryResult(outcome: .success, data: data))
      } else {
        let message = request.message ?? "unknown"
        completion(MarketHistoryResult(outcome: .failure(message), data: []))
      }
    })
  }

  // MARK: Market API calls

  /// Method to place a buy order in a specific market
  ///
  /// - Parameter completion: Escaping BuyLimitResult object
  final func getBuyLimit(completion: @escaping ((BuyLimitResult) -> Void)) {
    marketApi.getBuyLimit { (request) in
      if request.success == true, let data = request.result {
        completion(BuyLimitResult(outcome: .success, data: [data]))
      } else {
        let message = request.message ?? "unknown"
        completion(BuyLimitResult(outcome: .failure(message), data: []))
      }
    }
  }


  /// Method to place a sell order in a specific market
  ///
  /// - Parameter completion: Escaping SellLimitResult object
  final func getSellLimit(completion: @escaping ((SellLimitResult) -> Void)) {
    marketApi.getSellLimit { (request) in
      if request.success == true, let data = request.result {
        completion(SellLimitResult(outcome: .success, data: [data]))
      } else {
        let message = request.message ?? "unknown"
        completion(SellLimitResult(outcome: .failure(message), data: []))
      }
    }
  }

  /// Method to cancel a buy or sell order
  ///
  /// - Parameter completion: Escaping CancelResult object
  final func cancel(completion: @escaping ((CancelResult) -> Void)) {
    marketApi.cancel { (request) in
      if request.success == true, let data = request.result {
        completion(CancelResult(outcome: .success, data: [data]))
      } else {
        let message = request.message ?? "unknown"
        completion(CancelResult(outcome: .failure(message), data: []))
      }
    }
  }

  /// Method to return all orders that the user has open
  ///
  /// - Parameter completion: Escaping OpenOrdersResult object
  final func getOpenOrders(completion: @escaping ((OpenOrdersResult) -> Void)) {
    marketApi.getOpenOrders { (request) in
      if request.success == true, let data = request.result {
        completion(OpenOrdersResult(outcome: .success, data: data))
      } else {
        let message = request.message ?? "unknown"
        completion(OpenOrdersResult(outcome: .failure(message), data: []))
      }
    }
  }
}
