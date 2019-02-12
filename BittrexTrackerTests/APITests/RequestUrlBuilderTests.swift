//
//  RequestUrlBuilderTests.swift
//  BittrexTrackerTests
//
//  Created by Matthew Dovey on 29/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import XCTest
@testable import BittrexTracker

class RequestUrlBuilderTests: XCTestCase {
  
  private var urlBuilder: RequestUrlBuilder!
  
  override func setUp() {
    urlBuilder = RequestUrlBuilder(key: "testKey", secret: "testSecret")
  }

  // MARK: public URL tests
  
  func testCurrenciesUrl() {
    let currenciesUrl = urlBuilder.buildUrl(for: .Currencies)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getcurrencies"
    XCTAssertEqual(currenciesUrl, actualUrl)
  }
  
  func testMarketsUrl() {
    let marketUrl = urlBuilder.buildUrl(for: .Markets)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarkets"
    XCTAssertEqual(marketUrl, actualUrl)
  }

  func testTickerUrl() {
    let ticketUrl = urlBuilder.buildUrl(for: .Ticker)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getticker?market="
    XCTAssertEqual(ticketUrl, actualUrl)
  }
  
  func testMarketSummariesUrl() {
    let marketSummariesUrl = urlBuilder.buildUrl(for: .MarketSummaries)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarketsummaries"
    XCTAssertEqual(marketSummariesUrl, actualUrl)
  }
  
  func testMarketSummaryUrl() {
    let marketSummaryUrl = urlBuilder.buildUrl(for: .MarketSummary)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarketsummary?market="
    XCTAssertEqual(marketSummaryUrl, actualUrl)
  }
  
  func testMarketHistoryUrl() {
    let marketHistoryUrl = urlBuilder.buildUrl(for: .MarketHistory)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarkethistory?market="
    XCTAssertEqual(marketHistoryUrl, actualUrl)
  }

  func testOrderBookUrl() {
    let orderBookUrl = urlBuilder.buildUrl(for: .OrderBook)
  }

  // MARK: market URL tests

  func testBuyLimitUrl() {
    
  }

  func testSellLimitUrl() {

  }

  func testCancelUrl() {

  }

  func testOpenOrdersUrl() {

  }

  // MARK: account URL tests
  
  func testBalanceUrl() {
    let balanceUrl = urlBuilder.buildUrlFor(request: .Balance)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalance?apikey=testKey&currency="
    XCTAssertEqual(balanceUrl, actualUrl)
  }
  
  func testBalancesUrl() {
    let balancesUrl = urlBuilder.buildUrlFor(request: .Balances)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalances?apikey=testKey"
    XCTAssertEqual(balancesUrl, actualUrl)
  }

  func testDepositHistoryUrl() {
    let depositHistoryUrl = urlBuilder.buildUrlFor(request: .DepositHistory)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getdeposithistory?currency="
    XCTAssertEqual(depositHistoryUrl, actualUrl)
  }
  
  func testOrderHistoryUrl() {
    let orderHistoryUrl = urlBuilder.buildUrlFor(request: .OrderHistory)
    print(orderHistoryUrl)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getorderhistory"
    XCTAssertEqual(orderHistoryUrl, actualUrl)
  }

  func testWithdrawalHistoryUrl() {
    let withdrawalHistoryUrl = urlBuilder.buildUrlFor(request: .WithdrawalHistory)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getwithdrawalhistory"
    XCTAssertEqual(withdrawalHistoryUrl, actualUrl)
  }

  func testDepositAddressUrl() {

  }

  func testOrderUrl() {

  }

  func testWithdrawUrl() {

  }
}
