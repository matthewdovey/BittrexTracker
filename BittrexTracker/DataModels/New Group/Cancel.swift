//
//  Cancel.swift
//  BittrexTracker
//
//  Created by Matthew Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

/// The data structure for the results of the cancel request
struct Cancel: Decodable {
  let uuid: String
  
  private enum CodingKeys: String, CodingKey {
    case uuid = "UUID"
  }
}
