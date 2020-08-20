//
//  Session.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

struct Session : Codable {
     struct Data : Codable {
             let session: String
      }
    let status: Int
    let data: Data?
    let error: String?
}
