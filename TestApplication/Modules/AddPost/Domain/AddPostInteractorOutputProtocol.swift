//
//  AddPostInteractorOutput.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

protocol AddPostInteractorOutputProtocol {
    func onSuccess(result: AddingEntry)
    func onError(error: String)
}
