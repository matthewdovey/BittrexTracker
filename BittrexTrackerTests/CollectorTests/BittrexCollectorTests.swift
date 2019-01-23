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
private let BALANCES_DATA_FILE = "balances_test_data"
private let BALANCE_DATA_FILE = "balance_test_data"
private let JSON = "json"

class BittrexCollectorTests : XCTestCase {
  
  private var collector: BittrexCollector!
  private var session: URLSessionMock!
  private var bundle: Bundle?
  private var testDataUrl: URL?
  
  override func setUp() {
    session = URLSessionMock()
    collector = BittrexCollector(session: session, apiKey: "", apiSecret: "")
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
    print("Currency Error: \(session.error)")
    collector.getCurrencies() { (results, error) in
      //XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetCurrenciesReturnsSuccess() {
    session.error = nil
    collector.getCurrencies() { (results, error) in
      //XCTAssertTrue(results.success == true)
    }
  }
  
  func testGetCurrenciesReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getCurrencies() { (results, error) in
      //XCTAssertFalse(results.success == true)
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
    print("Markets Error: \(session.error)")
    collector.getMarkets() { (results, error) in
      //XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetMarketsReturnsSuccess() {
    session.error = nil
    collector.getMarkets() { (results, error) in
      XCTAssertTrue(error == nil)
    }
  }
  
  func testGetMarketsReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getMarkets() { (results, error) in
      XCTAssertTrue(error != nil)
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
    print("Ticker Error: \(session.error)")
    collector.getTickerFor(market: "") { (results, error) in
      XCTAssertTrue(results.result != nil)
    }
  }
  
  func testGetTickerForReturnsSuccess() {
    session.error = nil
    collector.getTickerFor(market: "") { (results, error) in
      XCTAssertTrue(result.success == true)
    }
  }
  
  func testGetTickerForReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getTickerFor(market: "") { (results, error) in
      XCTAssertFalse(result.success == true)
    }
  }
  
  // MARK: getMarketSummaries tests
  
  func testGetMarketSummariesReturnsData() {
    if let url = bundle?.url(forResource: SUMMARIES_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    collector.getMarketSummaries() { (results, error) in
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetMarketSummariesReturnsSuccess() {
    session.error = nil
    collector.getMarketSummaries() { (results, error) in
      XCTAssertTrue(results.success == true)
    }
  }
  
  func testGetMarketSummariesReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getMarketSummaries() { (results, error) in
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
    collector.getSummaryForMarket(market: "") { (results, error) in
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetSummaryForMarketReturnsSuccess() {
    session.error = nil
    collector.getSummaryForMarket(market: "") { (results, error) in
      XCTAssertTrue(results.success == true)
    }
  }
  
  func testGetSummaryForMarketReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getSummaryForMarket(market: "") { (results, error) in
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
    collector.getMarketHistoryFor(market: "") { (results, error) in
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetMarketHistoryForReturnsSuccess() {
    session.error = nil
    collector.getMarketHistoryFor(market: "") { (results, error) in
      XCTAssertTrue(error == nil)
    }
  }
  
  func testGetMarketHistoryForReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getMarketHistoryFor(market: "") { (results, error) in
      XCTAssertTrue(error != nil)
    }
  }
  
  // MARK: getBalances tests
  
  func testGetBalancesReturnsData() {
    if let url = bundle?.url(forResource: BALANCES_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    print("Balances Error: \(session.error)")
    collector.getBalances(apiKey: "") { (results, error) in
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }
  
  func testGetBalancesReturnsSuccess() {
    session.error = nil
    collector.getBalances(apiKey: "") { (results, error) in
      XCTAssertTrue(error == nil)
    }
  }
  
  func testGetBalancesReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    print("collector")
    print(collector)
    collector.getBalances(apiKey: "") { (results, error) in
      XCTAssertTrue(error != nil)
    }
  }
  
  // MARK: getBalanceFor tests
  
  func testGetBalanceForReturnsData() {
    if let url = bundle?.url(forResource: BALANCE_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    collector.getBalanceFor(apiKey: "", currency: "") { (results, error) in
      
    }
  }
  
  func testGetBalanceForReturnsSuccess() {
    session.error = nil
    collector.getBalanceFor(apiKey: "", currency: "") { (results, error) in
      
    }
  }
  
  func testGetBalanceForReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    collector.getBalanceFor(apiKey: "", currency: "") { (results, error) in
      
    }
  }
}
