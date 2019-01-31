//
//  BittrexCollectorTests.swift
//  BittrexTrackerTests
//
//  Created by Matthew  Dovey on 22/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import XCTest
@testable import BittrexTracker

private let BUNDLE_IDENTIFIER = "com.follow.BittrexTracker"
private let CURRENCY_DATA_FILE = "currency_test_data"
private let MARKETS_DATA_FILE = "markets_test_data"
private let TICKER_DATA_FILE = "ticker_test_data"
private let SUMMARY_DATA_FILE = "summary_test_data"
private let SUMMARIES_DATA_FILE = "summaries_test_data"
private let MARKET_HISTORY_DATA_FILE = "market_history_test_data"
private let ORDERBOOK_DATA_FILE = "orderbook_test_data"
private let JSON = "json"

class BittrexCollectorTests: XCTestCase {
  
  private var collector: PublicCollector!
  private var session: URLSessionMock!
  private var bundle: Bundle?
  
  override func setUp() {
    session = URLSessionMock()
    collector = PublicCollector(session: session)
    bundle = Bundle(identifier: BUNDLE_IDENTIFIER)
  }
  
  // MARK: getCurrencies tests
  
  func testGetCurrenciesReturnsData() {
    if let url = bundle?.url(forResource: CURRENCY_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    collector.getCurrencies() { results in
      XCTAssertTrue(results.success == true)
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetCurrenciesReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getCurrencies() { results in
      XCTAssertFalse(results.success == true)
    }
  }
  
  // MARK: getMarkets tests
  
  func testGetMarketsReturnsData() {
    if let url = bundle?.url(forResource: MARKETS_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    collector.getMarkets() { results in
      XCTAssertTrue(results.success == true)
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetMarketsReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getMarkets() { results in
      XCTAssertTrue(results.success == false)
    }
  }
  
  // MARK: getTickerFor tests
  
  func testGetTickerForReturnsData() {
    if let url = bundle?.url(forResource: TICKER_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    collector.getTickerFor(market: "btc-ltc") { results in
      XCTAssertTrue(results.success == true)
      XCTAssertNotNil(results.result)
    }
  }
  
  func testGetTickerForReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getTickerFor(market: "") { result in
      XCTAssertFalse(result.success == true)
    }
  }
  
  // MARK: getMarketSummaries tests
  
  func testGetMarketSummariesReturnsData() {
    if let url = bundle?.url(forResource: SUMMARIES_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        print(data)
        session.data = data
      } catch {}
    }
    collector.getMarketSummaries() { results in
      XCTAssertTrue(results.success == true)
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetMarketSummariesReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getMarketSummaries() { results in
      XCTAssertFalse(results.success == true)
    }
  }
  
  // MARK: getSummaryForMarket tests
  
  func testGetSummaryForMarketReturnsData() {
    if let url = bundle?.url(forResource: SUMMARY_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    collector.getSummaryForMarket(market: "") { results in
      XCTAssertTrue(results.success == true)
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetSummaryForMarketReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getSummaryForMarket(market: "") { results in
      XCTAssertFalse(results.success == true)
    }
  }
  
  // MARK: getMarketHistoryFor tests
  
  func testGetMarketHistoryForReturnsData() {
    if let url = bundle?.url(forResource: MARKET_HISTORY_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    collector.getMarketHistoryFor(market: "") { results in
      XCTAssertTrue(results.success == true)
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetMarketHistoryForReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getMarketHistoryFor(market: "") { results in
      XCTAssertFalse(results.success == true)
    }
  }
  
  //TODO: add tests for OrderBook API method
}
