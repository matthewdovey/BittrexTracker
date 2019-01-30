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
  
  /// Setter to allow the API key to be set for the user's wallet
  ///
  /// - Parameter key: user's wallet API key
  public func setApiKey(key: String) {
    urlBuilder.setKey(key: key)
  }
  
  // TODO: buyLimit - market
  final func getBuyLimit(completion: @escaping (() -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .BuyLimit))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        
      } else {
        if data != nil {
          do {
            
          } catch {
            
          }
        } else {
          
        }
      }
    }
  }
  
  // TODO: sellLimit - market
  final func getSellLimit(completion: @escaping (() -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .SellLimit))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        
      } else {
        if data != nil {
          do {
            
          } catch {
            
          }
        } else {
          
        }
      }
    }
  }
  
  // TODO: cancel - market
  final func cancel(completion: @escaping (() -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .Cancel))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        
      } else {
        if data != nil {
          do {
            
          } catch {
            
          }
        } else {
          
        }
      }
    }
  }
  
  // TODO: getOpenOrders - market
  final func getOpenOrders(completion: @escaping (() -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .OpenOrders))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        
      } else {
        if data != nil {
          do {
            
          } catch {
            
          }
        } else {
          
        }
      }
    }
  }
}
