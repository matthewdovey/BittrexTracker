//
//  SignedURLRequest.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 30/03/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import CryptoSwift

final class SignedURLRequest {
  
  private let url: URL
  private let apiKey: String
  private let apiSecret: String
  
  init(url: URL, apiKey: String, apiSecret: String) {
    self.url = url
    self.apiKey = apiKey
    self.apiSecret = apiSecret
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
  
  public var request: URLRequest {
    var urlRequest = URLRequest(url: url)
    urlRequest.allHTTPHeaderFields = ["apisign": hmacString]
    urlRequest.httpMethod = "POST"
    return urlRequest
  }
}
