//
//  MainScreenInteractorOutputProtocol.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 21.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

protocol MainScreenInteractorOutputProtocol {
    func onSuccess(result: Session)
    func onError(error: String)
}
