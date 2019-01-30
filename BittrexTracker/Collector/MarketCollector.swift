//
//  MarketCollector.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Class to provide all market related API calls to the Bittrex exchange
final class MarketCollector {
  
  private var session: URLSession
  private var urlBuilder: RequestUrlBuilder
  private var apiKey: String
  
  /// Initialiser to accept required dependencies to make valid market API requests
  ///
  /// - Parameters:
  ///   - session: URLSession object
  ///   - apiKey: The user's API key
  init(session: URLSession = .shared, apiKey: String = "") {
    self.session = session
    self.apiKey = apiKey
    self.urlBuilder = RequestUrlBuilder(key: apiKey, secret: "")
  }
  
  // TODO: buyLimit - market
  final func getBuyLimit() {
    
  }
  
  // TODO: sellLimit - market
  final func getSellLimit() {
    
  }
  
  // TODO: cancel - market
  final func cancel() {
    
  }
  
  // TODO: getOpenOrders - market
  final func getOpenOrders() {
    
  }
}
