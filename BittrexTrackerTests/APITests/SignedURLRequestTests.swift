//
//  SignedURLRequestTests.swift
//  BittrexTrackerTests
//
//  Created by Matthew Dovey on 30/03/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import XCTest
import CryptoSwift

class SignedURLRequestTests: XCTestCase {
  
  private var url: URL!
  private var apiKey: String!
  private var apiSecret: String!
  private var signedRequest: SignedURLRequest!
  
  override func setUp() {
    apiKey = "40f1ca9a1ad74913a1ac90f18141jd46"
    apiSecret = "hd74hj3i34949rjf473genf9f940t"
    let urlString = "https://api.bittrex.com/api/v1.1/account/getbalances?apikey=" + apiKey
    url = URL(string: urlString)!
    signedRequest = SignedURLRequest(url: url, apiKey: apiKey, apiSecret: apiSecret)
  }
  
  private var hmacString: String {
    let secretUInt8: [UInt8] = Array(url.absoluteString.utf8)
    var hmac: [UInt8] = []
    do {
      try hmac = HMAC(key: apiSecret, variant: .sha512).authenticate(secretUInt8)
    } catch {
      print(error)
    }
    return hmac.toHexString()
  }
  
  func testSignedURLRequestSuccessfullyReturnsRequest() {
    XCTAssertNotNil(signedRequest.request)
  }
  
  func testSignedURLRequestHasCorrectHeaders() {
    let signedFields = signedRequest.request.allHTTPHeaderFields
    let expectedFields = ["apisign":hmacString]
    XCTAssertEqual(signedFields, expectedFields)
  }
  
  func testSignedURLRequestHasCorrectHTTPMethod() {
    XCTAssertEqual(signedRequest.request.httpMethod, "POST")
  }
}
