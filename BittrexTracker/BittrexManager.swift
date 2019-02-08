//
//  BittrexManager.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

///
final class BittrexManager {

  private let publicCollector: PublicCollector
  private let session: URLSession
  private let urlBuilder: RequestUrlBuilder

  ///
  init() {
    session = URLSession.shared
    urlBuilder = RequestUrlBuilder()
    publicCollector = PublicCollector(session: session, builder: urlBuilder)
  }

  /// Method to return all currencies listed on the exchange
  ///
  /// - Parameter completion: Escaping CoinRequest object
  public final func getCurrencies(completion: @escaping ((CoinRequest) -> Void)) {

  }

  /// Method to return all markets for currencies
  ///
  /// - Parameter completion: Escaping MarketsRequest object
  public final func getMarkets(completion: @escaping ((MarketsRequest) -> Void)) {

  }

  /// Method to return ticker results for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping TickerRequest object
  public final func getTickerFor(market: String, completion: @escaping ((TickerRequest) -> Void)) {

  }

  /// Method to return all market summaires
  ///
  /// - Parameter completion: Escaping MarketSummaryRequest object
  public final func getMarketSummaries(completion: @escaping ((MarketSummaryRequest) -> Void)) {

  }

  /// Method to return a market summary for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping MarketSummaryRequest object
  public final func getSummaryForMarket(market: String, completion: @escaping ((MarketSummaryRequest) -> Void)) {

  }

  /// Method to return the order book for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - type: Orderbook type
  ///   - completion: Escaping OrderBookRequest object
  public final func getOrderBook(market: String, type: String, completion: @escaping ((OrderBookRequest) -> Void)) {

  }

  /// Method to retrieve the market history for a specified currency
  ///
  /// - Parameters:
  ///   - market: The market to retrieve data for
  ///   - completion: Escaping MarketHistoryRequest object
  public final func getMarketHistoryFor(market: String, completion: @escaping ((MarketHistoryRequest) -> Void)) {
    
  }
}
