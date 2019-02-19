//
//  BittrexManagerTests.swift
//  BittrexTrackerTests
//
//  Created by Matthew Dovey on 18/02/2019.
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
private let MARKET = "btc-ltc"
private let TYPE = "both"

class BittrexManagerTests: XCTestCase {
  
  var bittrexManager: BittrexManager!
  var session: URLSessionMock!
  var bundle: Bundle!
  
  override func setUp() {
    session = URLSessionMock()
    bittrexManager = BittrexManager(session: session)
    bundle = Bundle(identifier: BUNDLE_IDENTIFIER)
  }
  
  // MARK: public API calls
  
  func testGetCurrenciesReturnsSuccess() {
    if let url = bundle?.url(forResource: CURRENCY_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    bittrexManager.getCurrencies { result in
      switch result {
      case .success(_):
        XCTAssert(true)
      case .failure(_):
        XCTAssert(false)
      }
    }
  }
  
  func testGetCurrenciesReturnsFailure() {
    
  }
  
  func testGetMarketsReturnSuccess() {
    if let url = bundle?.url(forResource: MARKETS_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    bittrexManager.getMarkets { result in
      switch result {
      case .success(_):
        XCTAssert(true)
      case .failure(_):
        XCTAssert(false)
      }
    }
  }
  
  func testGetMarketsReturnsFailure() {
    
  }
  
  func testGetTickerReturnsSuccess() {
    if let url = bundle?.url(forResource: TICKER_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    bittrexManager.getTickerFor(market: MARKET) { result in
      switch result {
      case .success(_):
        XCTAssert(true)
      case .failure(_):
        XCTAssert(false)
      }
    }
  }
  
  func testGetTickerReturnsFailure() {
    
  }
  
  func testGetMarketSummariesReturnsSuccess() {
    if let url = bundle?.url(forResource: SUMMARIES_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    bittrexManager.getMarketSummaries { result in
      switch result {
      case .success(_):
        XCTAssert(true)
      case .failure(_):
        XCTAssert(false)
      }
    }
  }
  
  func testGetMarketSummariesReturnsFailure() {
    
  }
  
  func testGetMarketSummaryForReturnsSuccess() {
    if let url = bundle?.url(forResource: SUMMARY_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    bittrexManager.getSummaryForMarket(market: MARKET) { result in
      switch result {
      case .success(_):
        XCTAssert(true)
      case .failure(_):
        XCTAssert(false)
      }
    }
  }
  
  func testGetMarketSummaryForReturnsFailure() {
    
  }
  
  func testGetOrderBookReturnsSuccess() {
    if let url = bundle?.url(forResource: ORDERBOOK_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    bittrexManager.getOrderBook(market: MARKET, type: TYPE) { result in
      switch result {
      case .success(_):
        XCTAssert(true)
      case .failure(_):
        XCTAssert(false)
      }
    }
  }
  
  func testGetOrderBookReturnsFailure() {
    
  }
  
  func testGetMarketHistoryReturnsSuccess() {
    if let url = bundle?.url(forResource: MARKET_HISTORY_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    bittrexManager.getMarketHistoryFor(market: MARKET) { result in
      switch result {
      case .success(_):
        XCTAssert(true)
      case .failure(_):
        XCTAssert(false)
      }
    }
  }
  
  func testGetMarketHistoryReturnsFailure() {
    
  }
}
