//
//  BittrexManager.swift
//  BittrexTracker
//
//  Created by Matthew  Dovey on 31/01/2019.
//  Copyright © 2019 Matthew Dovey. All rights reserved.
//

import Foundation

///
final class BittrexManager {

  private let publicCollector: PublicCollector
  private let session: URLSession
  private let urlBuilder: RequestUrlBuilder

  ///
  init() {
    session = URLSession.shared
    urlBuilder = RequestUrlBuilder()
    publicCollector = PublicCollector(session: session, builder: urlBuilder)
  }

  
}
