//
//  ViewFullPostViewController.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class ViewFullPostViewModel: ViewFullPostOutputProtocol {
    func formatDate(date: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        return formatter.string(from: Date(timeIntervalSince1970: NumberFormatter().number(from: date ?? "0")?.doubleValue ?? 0))
    }
}
