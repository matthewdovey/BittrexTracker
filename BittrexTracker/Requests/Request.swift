//
//  Request.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 28/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

protocol Request: Decodable {
  var success: Bool? { get set }
  var message: String? { get set }
  var result: [Model]? { get set }
}
