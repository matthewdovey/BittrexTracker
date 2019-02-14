//
//  Outcome.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 08/02/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// Outcome unum to provide the result of the request
///
/// - success: Denoting successful request
/// - failure: Denoting failure with error message
public enum Outcome {
  case success
  case failure(String)
}
