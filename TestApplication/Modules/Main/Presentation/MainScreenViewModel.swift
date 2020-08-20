//
//  MainScreenViewModel.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 21.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class MainScreenViewModel: MainScreenInteractorOutputProtocol, MainScreenOutputProtocol {
    lazy var interactor: MainScreenInteractorInputProtocol = MainScreenInteractor(viewModel: self)
    var view: MainScreenInputProtocol?
    
    init(view: MainScreenInputProtocol) {
        self.view = view
    }
    
    func onSuccess(result: Session) {
        UserDefaults.standard.set(result.data?.session, forKey: "session")
    }
    
    func onError(error: String) {
        view?.showError(error: error)
    }
    
    func viewDidLoad() {
        if UserDefaults.standard.string(forKey: "session") == nil || UserDefaults.standard.string(forKey: "session") == "" {
            interactor.requestSession()
        }
    }
}
