//
//  BittrexCollectorTests.swift
//  BittrexTrackerTests
//
//  Created by Matthew  Dovey on 22/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import XCTest
@testable import BittrexTracker

class BittrexCollectorTests : XCTestCase {
  
  private var collector: BittrexCollector!
  private var session: URLSessionMock!
  
  override func setUp() {
    //TODO: setup properties and objects for tests
    session = URLSessionMock()
    collector = BittrexCollector(session: session, apiKey: "", apiSecret: "")
  }
  
  func testGetCurrencies() {
    do {
      let contents: String = try String(contentsOf: Bundle(identifier: "com.follow.BittrexTracker")?.url(forResource: "test_data", withExtension: "json") ?? URL(fileURLWithPath: "url"))
      print(contents.data(using: .utf8))
      session.data = contents.data(using: .utf8)
    } catch {
      
    }
    
    print(Bundle.main.path(forResource: "test_data", ofType: "json"))
    
    print(session.data)
    
    collector.getCurrencies() { results in
      print(results.result)
    }
  }
  
  func testGetMarkets() {
    
  }
  
  func testGetTickerFor() {
    
  }
  
  func testGetMarketSummaries() {
    
  }
  
  func testGetSummaryForMarket() {
    
  }
  
  func testGetMarketHistoryFor() {
    
  }
  
  func testGetBalance() {
    
  }
  
  func testGetBalanceFor() {
    
  }
}
