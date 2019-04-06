//
//  RequestUrlBuilderTests.swift
//  BittrexTrackerTests
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import XCTest
@testable import BittrexTracker

private let API_KEY = "testKey"
private let MARKET = "BTC-LTC"
private let QUANTITY = "15.55"
private let TYPE = "both"
private let RATE = "1.88"
private let UUID = "1234-2134-5675-3345"
private let CURRENCY = "BTC"
private let ADDRESS = "3456-3235-7887-3221"
private let PAY_ID = "122XDJA7HK655fJKkbs0"
private let NONCE = "testNonce"

class RequestUrlBuilderTests: XCTestCase {
  
  private var urlBuilder: RequestUrlBuilder!
  
  override func setUp() {
    urlBuilder = RequestUrlBuilder()
  }

  // MARK: public URL tests
  
  func testCurrenciesUrl() {
    let currenciesUrl = urlBuilder.buildUrl(for: .currencies, withParameters: [:])
    let actualUrl = "https://bittrex.com/api/v1.1/public/getcurrencies"
    XCTAssertEqual(currenciesUrl, actualUrl)
  }
  
  func testMarketsUrl() {
    let marketUrl = urlBuilder.buildUrl(for: .markets, withParameters: [:])
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarkets"
    XCTAssertEqual(marketUrl, actualUrl)
  }

  func testTickerUrl() {
    let parameters = [Placeholder.market : MARKET]
    let ticketUrl = urlBuilder.buildUrl(for: .ticker, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getticker?market=\(MARKET)"
    XCTAssertEqual(ticketUrl, actualUrl)
  }
  
  func testMarketSummariesUrl() {
    let marketSummariesUrl = urlBuilder.buildUrl(for: .marketSummaries, withParameters: [:])
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarketsummaries"
    XCTAssertEqual(marketSummariesUrl, actualUrl)
  }
  
  func testMarketSummaryUrl() {
    let parameters = [Placeholder.market : MARKET]
    let marketSummaryUrl = urlBuilder.buildUrl(for: .marketSummary, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarketsummary?market=\(MARKET)"
    XCTAssertEqual(marketSummaryUrl, actualUrl)
  }
  
  func testMarketHistoryUrl() {
    let parameters = [Placeholder.market : MARKET]
    let marketHistoryUrl = urlBuilder.buildUrl(for: .marketHistory, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarkethistory?market=\(MARKET)"
    XCTAssertEqual(marketHistoryUrl, actualUrl)
  }

  func testOrderBookUrl() {
    let parameters = [Placeholder.market : MARKET, Placeholder.type : TYPE]
    let orderBookUrl = urlBuilder.buildUrl(for: .orderBook, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getorderbook?market=\(MARKET)&type=\(TYPE)"
    XCTAssertEqual(orderBookUrl, actualUrl)
  }

  // MARK: market URL tests

  func testBuyLimitUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.market : MARKET,
                      Placeholder.quantity : QUANTITY,
                      Placeholder.rate : RATE]
    let buyLimitUrl = urlBuilder.buildUrl(for: .buyLimit, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/market/buylimit?apikey=\(API_KEY)&market=\(MARKET)&quantity=\(QUANTITY)&rate=\(RATE)"
    XCTAssertEqual(buyLimitUrl, actualUrl)
  }

  func testSellLimitUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.market : MARKET,
                      Placeholder.quantity : QUANTITY,
                      Placeholder.rate : RATE]
    let sellLimitUrl = urlBuilder.buildUrl(for: .sellLimit, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/market/selllimit?apikey=\(API_KEY)&market=\(MARKET)&quantity=\(QUANTITY)&rate=\(RATE)"
    XCTAssertEqual(sellLimitUrl, actualUrl)
  }

  func testCancelUrl() {
    let parameters = [Placeholder.apiKey : API_KEY, Placeholder.uuid : UUID]
    let cancelUrl = urlBuilder.buildUrl(for: .cancel, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/market/cancel?apikey=\(API_KEY)&uuid=\(UUID)"
    XCTAssertEqual(cancelUrl, actualUrl)
  }

  func testOpenOrdersUrl() {
    let parameters = [Placeholder.apiKey : API_KEY, Placeholder.market : MARKET]
    let openOrdersUrl = urlBuilder.buildUrl(for: .openOrders, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/market/getopenorders?apikey=\(API_KEY)&market=\(MARKET)"
    XCTAssertEqual(openOrdersUrl, actualUrl)
  }

  // MARK: account URL tests
  
  func testBalanceUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.currency : CURRENCY,
                      Placeholder.nonce : NONCE]
    let balanceUrl = urlBuilder.buildUrl(for: .balance, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalance?apikey=\(API_KEY)&currency=\(CURRENCY)&nonce=\(NONCE)"
    XCTAssertEqual(balanceUrl, actualUrl)
  }
  
  func testBalancesUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.nonce : NONCE]
    let balancesUrl = urlBuilder.buildUrl(for: .balances, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalances?apikey=\(API_KEY)&nonce=\(NONCE)"
    XCTAssertEqual(balancesUrl, actualUrl)
  }

  func testDepositHistoryUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.nonce : NONCE]
    let depositHistoryUrl = urlBuilder.buildUrl(for: .depositHistories, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getdeposithistory?apikey=\(API_KEY)&nonce=\(NONCE)"
    XCTAssertEqual(depositHistoryUrl, actualUrl)
  }
  
  func testDepositHistoryForUrl() {
    let parameters = [Placeholder.currency : CURRENCY,
                      Placeholder.apiKey : API_KEY,
                      Placeholder.nonce : NONCE]
    let depositHistoryUrl = urlBuilder.buildUrl(for: .depositHistory, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getdeposithistory?currency=\(CURRENCY)&apikey=\(API_KEY)&nonce=\(NONCE)"
    XCTAssertEqual(depositHistoryUrl, actualUrl)
  }
  
  func testOrderHistoriesUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.nonce : NONCE]
    let orderHistoryUrl = urlBuilder.buildUrl(for: .orderHistories, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getorderhistory?apikey=\(API_KEY)&nonce=\(NONCE)"
    XCTAssertEqual(orderHistoryUrl, actualUrl)
  }
  
  func testOrderHistoryUrl() {
    let parameters = [Placeholder.market : MARKET,
                      Placeholder.apiKey : API_KEY,
                      Placeholder.nonce : NONCE]
    let orderHistoryUrl = urlBuilder.buildUrl(for: .orderHistory, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getorderhistory?market=\(MARKET)&apikey=\(API_KEY)&nonce=\(NONCE)"
    XCTAssertEqual(orderHistoryUrl, actualUrl)
  }

  func testWithdrawalHistoryUrl() {
    let parameters = [Placeholder.currency : CURRENCY,
                      Placeholder.apiKey : API_KEY,
                      Placeholder.nonce : NONCE]
    let withdrawalHistoryUrl = urlBuilder.buildUrl(for: .withdrawalHistory, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getwithdrawalhistory?currency=\(CURRENCY)&apikey=\(API_KEY)&nonce=\(NONCE)"
    XCTAssertEqual(withdrawalHistoryUrl, actualUrl)
  }
  
  func textWithdrawalHistoriesUrl() {
    let withdrawalHistoriesUrl = urlBuilder.buildUrl(for: .withdrawalHistories, withParameters: [:])
    let actualUrl = "https://bittrex.com/api/v1.1/account/getwithdrawalhistory?apikey=\(API_KEY)&nonce=\(NONCE)"
    XCTAssertEqual(withdrawalHistoriesUrl, actualUrl)
  }

  func testDepositAddressUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.currency : CURRENCY,
                      Placeholder.nonce : NONCE]
    let depositAddressUrl = urlBuilder.buildUrl(for: .depositAddress, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getdepositaddress?apikey=\(API_KEY)&currency=\(CURRENCY)&nonce=\(NONCE)"
    XCTAssertEqual(depositAddressUrl, actualUrl)
  }

  func testOrderUrl() {
    let parameters = [Placeholder.uuid : UUID]
    let orderUrl = urlBuilder.buildUrl(for: .order, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getorder&uuid=\(UUID)"
    XCTAssertEqual(orderUrl, actualUrl)
  }

  func testWithdrawUrl() {
    let parameters = [Placeholder.apiKey : API_KEY,
                      Placeholder.currency : CURRENCY,
                      Placeholder.quantity : QUANTITY,
                      Placeholder.address : ADDRESS]
    let withdrawalUrl = urlBuilder.buildUrl(for: .withdraw, withParameters: parameters)
    let actualUrl = "https://bittrex.com/api/v1.1/account/withdraw?apikey=\(API_KEY)&currency=\(CURRENCY)&quantity=\(QUANTITY)&address=\(ADDRESS)"
    XCTAssertEqual(withdrawalUrl, actualUrl)
  }
}
