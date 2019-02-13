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

class RequestUrlBuilderTests: XCTestCase {
  
  private var urlBuilder: RequestUrlBuilder!
  
  override func setUp() {
    urlBuilder = RequestUrlBuilder(key: API_KEY, secret: "testSecret")
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
    let actualUrl = "https://bittrex.com/api/v1.1/public/getorderbook?market=&type=both"
    XCTAssertEqual(orderBookUrl, actualUrl)
  }

  // MARK: market URL tests

  func testBuyLimitUrl() {
    let buyLimitUrl = urlBuilder.buildUrl(for: .buyLimit)
    let actualUrl = "https://bittrex.com/api/v1.1/market/buylimit?apikey=\(API_KEY)&market=&quantity=&rate="
    XCTAssertEqual(buyLimitUrl, actualUrl)
  }

  func testSellLimitUrl() {
    let sellLimitUrl = urlBuilder.buildUrl(for: .sellLimit)
    let actualUrl = "https://bittrex.com/api/v1.1/market/selllimit?apikey=\(API_KEY)&market=&quantity=&rate="
    XCTAssertEqual(sellLimitUrl, actualUrl)
  }

  func testCancelUrl() {
    let cancelUrl = urlBuilder.buildUrl(for: .cancel)
    let actualUrl = "https://bittrex.com/api/v1.1/market/cancel?apikey=\(API_KEY)&uuid="
    XCTAssertEqual(cancelUrl, actualUrl)
  }

  func testOpenOrdersUrl() {
    let openOrdersUrl = urlBuilder.buildUrl(for: .openOrders)
    let actualUrl = "https://bittrex.com/api/v1.1/market/getopenorders?apikey=\(API_KEY)&market="
    XCTAssertEqual(openOrdersUrl, actualUrl)
  }

  // MARK: account URL tests
  
  func testBalanceUrl() {
    let balanceUrl = urlBuilder.buildUrl(for: .balance)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalance?apikey=\(API_KEY)testKey&currency="
    XCTAssertEqual(balanceUrl, actualUrl)
  }
  
  func testBalancesUrl() {
    let balancesUrl = urlBuilder.buildUrl(for: .balances)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getbalances?apikey=\(API_KEY)testKey"
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
    let depositAddressUrl = urlBuilder.buildUrl(for: .depositAddress)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getdepositaddress?apikey=\(API_KEY)&currency="
    XCTAssertEqual(depositAddressUrl, actualUrl)
  }

  func testOrderUrl() {
    let orderUrl = urlBuilder.buildUrl(for: .order)
    let actualUrl = "https://bittrex.com/api/v1.1/account/getorder&uuid=0cb4c4e4-bdc7-4e13-8c13-430e587d2cc1"
    XCTAssertEqual(orderUrl, actualUrl)
  }

  func testWithdrawUrl() {
    let withdrawalUrl = urlBuilder.buildUrl(for: .withdraw)
    let actualUrl = "https://bittrex.com/api/v1.1/account/withdraw?apikey=\(API_KEY)&currency=EAC&quantity=20.40&address=EAC_ADDRESS"
    XCTAssertEqual(withdrawalUrl, actualUrl)
  }
}
