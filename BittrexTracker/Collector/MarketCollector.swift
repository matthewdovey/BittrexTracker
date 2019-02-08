//
//  MarketCollector.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Class to provide all market related API calls to the Bittrex exchange
public final class MarketCollector {
  
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
  
  /// Setter to allow the API key to be set for the user's wallet
  ///
  /// - Parameter key: user's wallet API key
  public func setApiKey(key: String) {
    urlBuilder.setKey(key: key)
  }
  
  /// Method to place a buy order in a specific market
  ///
  /// - Parameter completion: Escaping BuyLimitRequest object
  final func getBuyLimit(completion: @escaping ((BuyLimitRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .BuyLimit))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(BuyLimitRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let buyLimit = try JSONDecoder().decode(BuyLimitRequest.self, from: data!)
            completion(buyLimit)
          } catch {
            completion(BuyLimitRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(BuyLimitRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
  
  
  /// Method to place a sell order in a specific market
  ///
  /// - Parameter completion: Escaping SellLimitRequest object
  final func getSellLimit(completion: @escaping ((SellLimitRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .SellLimit))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(SellLimitRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let sellLimit = try JSONDecoder().decode(SellLimitRequest.self, from: data!)
            completion(sellLimit)
          } catch {
            completion(SellLimitRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(SellLimitRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
  
  /// Method to cancel a buy or sell order
  ///
  /// - Parameter completion: Escaping CancelRequest object
  final func cancel(completion: @escaping ((CancelRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .Cancel))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(CancelRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let cancel = try JSONDecoder().decode(CancelRequest.self, from: data!)
            completion(cancel)
          } catch {
            completion(CancelRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(CancelRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
  
  /// Method to return all orders that the user has open
  ///
  /// - Parameter completion: Escaping OpenOrdersRequest object
  final func getOpenOrders(completion: @escaping ((OpenOrdersRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .OpenOrders))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(OpenOrdersRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let openOrders = try JSONDecoder().decode(OpenOrdersRequest.self, from: data!)
            completion(openOrders)
          } catch {
            completion(OpenOrdersRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(OpenOrdersRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
}
