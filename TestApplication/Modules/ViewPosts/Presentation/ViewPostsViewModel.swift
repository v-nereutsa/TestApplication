//
//  viewPostsViewModel.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class ViewPostsViewModel: ViewPostsInteractorOutputProtocol, ViewPostsOutputProtocol {

    lazy var interactor: ViewPostsInteractorInputProtocol = ViewPostsInteractor(viewModel: self)
    var view: ViewPostsInputProtocol?
    
    init(view: ViewPostsInputProtocol) {
        self.view = view
    }
    
    func requestPosts() {
        interactor.getPosts()
    }
    
    func onSuccess(posts: Posts) {
        view?.updatePosts(posts: posts)
    }
    
    func onError(error: String) {
        view?.showError(error: error)
    }
}
