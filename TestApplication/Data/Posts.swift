//
//  Posts.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

struct Posts : Codable {
    struct Post : Codable {
        let id: String
        let body: String
        let da: String
        let dm: String
    }
    let status: Int
    let data: [[Post]]?
    let error: String?
}
