//
//  AddScreenViewModel.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class AddScreenViewModel: AddPostInteractorOutputProtocol, AddScreenOutputProtocol {
    lazy var interactor: AddPostInteractorInputProtocol = AddPostInteractor(viewModel: self)
    var view: AddSreenInputProtocol?
    
    init(view: AddSreenInputProtocol) {
        self.view = view
    }
    
    func onSuccess(result: AddingEntry) {
        view?.showSuccessAlert()
    }
    
    func onError(error: String) {
        view?.showError(error: error)
    }
    
    func addPost(text: String) {
        interactor.addEntry(text: text)
    }
}
