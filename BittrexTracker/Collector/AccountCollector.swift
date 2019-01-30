//
//  AccountCollector.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation


/// Class to provide all account related API calls to the Bittrex exchange
final class AccountCollector {
  
  private var session: URLSession
  private var urlBuilder: RequestUrlBuilder
  
  /// Initialiser to create an instance of the Account Collector class
  ///
  /// - Parameters:
  ///   - session: URLSession object
  ///   - apiKey: the user's API key
  ///   - apiSecret: the user's API secret
  init(session: URLSession = .shared, apiKey: String = "", apiSecret: String = "") {
    self.session = session
    self.urlBuilder = RequestUrlBuilder(key: apiKey, secret: apiSecret)
  }
  
  /// Setter to allow the API key to be set for the user's wallet
  ///
  /// - Parameter key: user's wallet API key
  public func setApiKey(key: String) {
    urlBuilder.setKey(key: key)
  }
  
  /// Setter to allow the API secret to be set for the user's... TODO: finish docs
  ///
  /// - Parameter secret: user's API secret
  public func setApiSecret(secret: String) {
    urlBuilder.setSecret(secret: secret)
  }
  
  /// Method to retrieve the balance of a specified currency from the user's wallet
  ///
  /// - Parameters:
  ///   - currency: the balance for a specific currency
  ///   - completion: optionally returning a BalanceRequest object and an error
  final func getBalanceFor(currency: String, completion: @escaping ((BalanceRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .Balance)+currency)
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(BalanceRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let balance = try JSONDecoder().decode(BalanceRequest.self, from: data!)
            completion(balance)
          } catch {
            completion(BalanceRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(BalanceRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
  
  /// Method to retrieve all balances for the users wallet
  ///
  /// - Parameter completion: optionally returning a BalanceRequest and an error
  final func getBalances(completion: @escaping ((BalancesRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrlFor(request: .Balances))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(BalancesRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let balances = try JSONDecoder().decode(BalancesRequest.self, from: data!)
            completion(balances)
          } catch {
            completion(BalancesRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(BalancesRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
}