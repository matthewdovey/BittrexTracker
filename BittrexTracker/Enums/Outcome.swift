//
//  Outcome.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 08/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Outcome enum to provide the result of the request
///
/// - success: Denoting successful request encapsulating the data
/// - failure: Denoting failure encapsulating an error message
public enum Outcome<T, String> {
  case success(data: T)
  case failure(error: String)
}
