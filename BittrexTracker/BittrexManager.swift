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

  private let publicCollector: PublicCollector
  private let session: URLSession
  private let urlBuilder: RequestUrlBuilder

  /// Initialiser to create all collectors and their required dependencies
  public init() {
    session = URLSession.shared
    urlBuilder = RequestUrlBuilder()
    publicCollector = PublicCollector(session: session, builder: urlBuilder)
  }

  /// Method to return all currencies listed on the exchange
  ///
  /// - Parameter completion: Escaping CoinResult object
  public final func getCurrencies(completion: @escaping ((CoinResult) -> Void)) {
    publicCollector.getCurrencies { (request) in
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
    publicCollector.getMarkets { (request) in
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
    publicCollector.getTickerFor(market: market, completion: { (request) in
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
    publicCollector.getMarketSummaries { (request) in
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
    publicCollector.getSummaryForMarket(market: market, completion: { (request) in
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
    publicCollector.getOrderBook(market: market, type: type, completion: { (request) in
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
    publicCollector.getMarketHistoryFor(market: market, completion: { (request) in
      if request.success == true, let data = request.result {
        completion(MarketHistoryResult(outcome: .success, data: data))
      } else {
        let message = request.message ?? "unknown"
        completion(MarketHistoryResult(outcome: .failure(message), data: []))
      }
    })
  }
}
