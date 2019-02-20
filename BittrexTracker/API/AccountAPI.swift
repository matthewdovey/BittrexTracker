//
//  AccountAPI.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Class to provide all account related API calls to the Bittrex exchange
final class AccountAPI {
  
  private var session: URLSession
  private var urlBuilder: RequestUrlBuilder
  
  /// Initialiser to create an instance of the Account API class
  ///
  /// - Parameters:
  ///   - session: URLSession object
  ///   - apiKey: The user's API key
  ///   - apiSecret: The user's API secret
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
  ///   - completion: Escaping BalanceRequest object
  final func getBalanceFor(currency: String, completion: @escaping ((BalanceRequest) -> Void)) {
    let parameters = [Placeholder.currency : currency]
    let url = URL(string: urlBuilder.buildUrl(for: .balance, withParameters: parameters))
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
  /// - Parameter completion: Escaping BalancesRequest object
  final func getBalances(completion: @escaping ((BalancesRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrl(for: .balances, withParameters: [:]))
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
  
  /// Method to retrieve deposit address for a specific currency
  ///
  /// - Parameters:
  ///   - currency: The specific currency
  ///   - completion: Escaping DepositAddressRequest object
  final func getDepositAddress(currency: String, completion: @escaping ((DepositAddressRequest) -> Void)) {
    let parameters = [Placeholder.currency : currency]
    let url = URL(string: urlBuilder.buildUrl(for: .depositAddress, withParameters: parameters))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(DepositAddressRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let depositAddress = try JSONDecoder().decode(DepositAddressRequest.self, from: data!)
            completion(depositAddress)
          } catch {
            completion(DepositAddressRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(DepositAddressRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
  
  final func withdraw(currency: String,
                      quantity: Float,
                      address: String,
                      completion: @escaping ((Withdraw) -> Void)) {
    //let url = URL(string: urlBuilder.buildUrlFor(request: ))
  }
}
