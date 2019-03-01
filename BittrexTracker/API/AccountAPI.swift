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
                      completion: @escaping ((WithdrawRequest) -> Void)) {
    let parameters: [Placeholder : String] = [.currency : currency,
                                              .quantity : String(quantity),
                                              .address : address]
    let url = URL(string: urlBuilder.buildUrl(for: .withdraw, withParameters: parameters))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(WithdrawRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let withdrawRequest = try JSONDecoder().decode(WithdrawRequest.self, from: data!)
            completion(withdrawRequest)
          } catch {
            completion(WithdrawRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(WithdrawRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }

  final func getOrder(uuid: String, completion: @escaping ((OrderRequest) -> Void)) {
    let parameters = [Placeholder.uuid : uuid]
    let url = URL(string: urlBuilder.buildUrl(for: .order, withParameters: parameters))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(OrderRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let orderRequest = try JSONDecoder().decode(OrderRequest.self, from: data!)
            completion(orderRequest)
          } catch {
            completion(OrderRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(OrderRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }

  final func getOrderHistory(market: String, completion: @escaping ((OrderHistoryRequest) -> Void)) {
    let parameters = [Placeholder.market : market]
    let url = URL(string: urlBuilder.buildUrl(for: .orderHistory, withParameters: parameters))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(OrderHistoryRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let orderHistoryRequest = try JSONDecoder().decode(OrderHistoryRequest.self, from: data!)
            completion(orderHistoryRequest)
          } catch {
            completion(OrderHistoryRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(OrderHistoryRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }

  final func getWithdrawalHistories(completion: @escaping ((WithdrawalHistoryRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrl(for: .withdrawalHistories, withParameters: [:]))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(WithdrawalHistoryRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let withdrawHistoryRequest = try JSONDecoder().decode(WithdrawalHistoryRequest.self, from: data!)
            completion(withdrawHistoryRequest)
          } catch {
            completion(WithdrawalHistoryRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(WithdrawalHistoryRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }

  final func getWithdrawalHistory(currency: String, completion: @escaping ((WithdrawalHistoryRequest) -> Void)) {
    let parameters = [Placeholder.currency : currency]
    let url = URL(string: urlBuilder.buildUrl(for: .withdrawalHistory, withParameters: parameters))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(WithdrawalHistoryRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let withdrawHistoryRequest = try JSONDecoder().decode(WithdrawalHistoryRequest.self, from: data!)
            completion(withdrawHistoryRequest)
          } catch {
            completion(WithdrawalHistoryRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(WithdrawalHistoryRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }

  final func getDepositHistories(completion: @escaping ((DepositHistoryRequest) -> Void)) {
    let url = URL(string: urlBuilder.buildUrl(for: .depositHistories, withParameters: [:]))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(DepositHistoryRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
            let depositHistoryRequest = try JSONDecoder().decode(DepositHistoryRequest.self, from: data!)
            completion(depositHistoryRequest)
          } catch {
            completion(DepositHistoryRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(DepositHistoryRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }

  final func getDepositHistory(currency: String, completion: @escaping ((DepositHistoryRequest) -> Void)) {
    let parameters = [Placeholder.currency : currency]
    let url = URL(string: urlBuilder.buildUrl(for: .depositHistory, withParameters: parameters))
    let task = session.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        completion(DepositHistoryRequest(success: false, message: String(describing: error), result: nil))
      } else {
        if data != nil {
          do {
          let depositHistoryRequest = try JSONDecoder().decode(DepositHistoryRequest.self, from: data!)
            completion(depositHistoryRequest)
          } catch {
            completion(DepositHistoryRequest(success: false, message: String(describing: error), result: nil))
          }
        } else {
          completion(DepositHistoryRequest(success: false, message: nil, result: nil))
        }
      }
    }
    task.resume()
  }
}
