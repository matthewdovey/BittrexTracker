//
//  AccountCollectorTests.swift
//  BittrexTrackerTests
//
//  Created by Matthew Dovey on 30/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import XCTest
@testable import BittrexTracker

private let BUNDLE_IDENTIFIER = "com.follow.BittrexTracker"
private let BALANCES_DATA_FILE = "balances_test_data"
private let BALANCE_DATA_FILE = "balance_test_data"
private let JSON = "json"

class AccountCollectorTests: XCTestCase {
  
  private var api: AccountAPI!
  private var session: URLSessionMock!
  private var bundle: Bundle?
  
  override func setUp() {
    session = URLSessionMock()
    api = AccountAPI(session: session, apiKey: "", apiSecret: "")
    bundle = Bundle(identifier: BUNDLE_IDENTIFIER)
  }

  // MARK: getBalances tests

  func testGetBalancesReturnsData() {
    if let url = bundle?.url(forResource: BALANCES_DATA_FILE, withExtension: JSON) {
      do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        session.data = data
      } catch {}
    }
    api.getBalances() { results in
      XCTAssertTrue(results.success == true)
      XCTAssertFalse(results.result?.isEmpty == true)
    }
  }

  func testGetBalancesReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    api.getBalances() { results in
      XCTAssertFalse(results.success == true)
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
    api.getBalanceFor(currency: "") { results in
      XCTAssertTrue(results.success == true)
      XCTAssertNotNil(results.result)
    }
  }

  func testGetBalanceForReturnsFailure() {
    session.error = URLError(.cannotParseResponse)
    api.getBalanceFor(currency: "") { results in
      XCTAssertFalse(results.success == true)
    }
  }
}
