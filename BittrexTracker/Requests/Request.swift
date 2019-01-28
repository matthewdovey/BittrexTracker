//
//  Request.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 28/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

struct Request: Decodable {
  let success: Bool?
  let message: String?
  //let result: [Any]?
}
