//
//  AddPostInteractor.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class AddPostInteractor: AddPostInteractorInputProtocol {
    
    var viewModel: AddPostInteractorOutputProtocol
    
    init(viewModel: AddPostInteractorOutputProtocol) {
        self.viewModel = viewModel
    }
    
    func addEntry(text: String) {
        NetworkClient.shared.addEntry(entryText: text, completion: {[weak self] addingEntry, error in
            if let unwrapped = addingEntry {
                if unwrapped.status == 1 {
                    self?.viewModel.onSuccess(result: unwrapped)
                } else {
                    self?.viewModel.onError(error: unwrapped.error ?? "Unknown error")
                }
            } else {
                self?.viewModel.onError(error: error ?? "Unknown error")
            }
        })
    }
}
