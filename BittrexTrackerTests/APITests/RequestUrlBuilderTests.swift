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
    let currenciesUrl = urlBuilder.buildUrl(for: .currencies)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getcurrencies"
    XCTAssertEqual(currenciesUrl, actualUrl)
  }
  
  func testMarketsUrl() {
    let marketUrl = urlBuilder.buildUrl(for: .markets)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarkets"
    XCTAssertEqual(marketUrl, actualUrl)
  }

  func testTickerUrl() {
    let ticketUrl = urlBuilder.buildUrl(for: .ticker)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getticker?market="
    XCTAssertEqual(ticketUrl, actualUrl)
  }
  
  func testMarketSummariesUrl() {
    let marketSummariesUrl = urlBuilder.buildUrl(for: .marketSummaries)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarketsummaries"
    XCTAssertEqual(marketSummariesUrl, actualUrl)
  }
  
  func testMarketSummaryUrl() {
    let marketSummaryUrl = urlBuilder.buildUrl(for: .marketSummary)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarketsummary?market="
    XCTAssertEqual(marketSummaryUrl, actualUrl)
  }
  
  func testMarketHistoryUrl() {
    let marketHistoryUrl = urlBuilder.buildUrl(for: .marketHistory)
    let actualUrl = "https://bittrex.com/api/v1.1/public/getmarkethistory?market="
    XCTAssertEqual(marketHistoryUrl, actualUrl)
  }

  func testOrderBookUrl() {
    let orderBookUrl = urlBuilder.buildUrl(for: .orderBook)
  }

  // MARK: market URL tests

  func testBuyLimitUrl() {
    let buyLimitUrl = urlBuilder.buildUrl(for: .buyLimit)
  }

  func testSellLimitUrl() {

  }

  func testCancelUrl() {

  }

  func testOpenOrdersUrl() {

  }

  // MARK: account URL tests
  
  func testBalanceUrl() {
    let balanceUrl = urlBuilder.buildUrl(for: .balance)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalance?apikey=testKey&currency="
    XCTAssertEqual(balanceUrl, actualUrl)
  }
  
  func testBalancesUrl() {
    let balancesUrl = urlBuilder.buildUrl(for: .balances)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalances?apikey=testKey"
    XCTAssertEqual(balancesUrl, actualUrl)
  }

  func testDepositHistoryUrl() {
    let depositHistoryUrl = urlBuilder.buildUrl(for: .depositHistory)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getdeposithistory?currency="
    XCTAssertEqual(depositHistoryUrl, actualUrl)
  }
  
  func testOrderHistoryUrl() {
    let orderHistoryUrl = urlBuilder.buildUrl(for: .orderHistory)
    print(orderHistoryUrl)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getorderhistory"
    XCTAssertEqual(orderHistoryUrl, actualUrl)
  }

  func testWithdrawalHistoryUrl() {
    let withdrawalHistoryUrl = urlBuilder.buildUrl(for: .withdrawalHistory)
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
