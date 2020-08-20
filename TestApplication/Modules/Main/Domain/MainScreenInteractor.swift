//
//  MainScreenInteractor.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 21.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class MainScreenInteractor: MainScreenInteractorInputProtocol {
    
    var viewModel: MainScreenInteractorOutputProtocol
    
    init(viewModel: MainScreenInteractorOutputProtocol) {
        self.viewModel = viewModel
    }
    
    func requestSession() {
        NetworkClient.shared.createNewSession(completion: {[weak self] session, error in
            if let unwrappedSession = session {
                if unwrappedSession.status == 1 {
                    self?.viewModel.onSuccess(result: unwrappedSession)
                } else {
                    self?.viewModel.onError(error: unwrappedSession.error ?? "Unknown error")
                }
            } else {
                self?.viewModel.onError(error: error ?? "Unknown error")
            }
        })
    }
}
