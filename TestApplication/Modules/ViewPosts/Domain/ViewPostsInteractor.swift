//
//  ViewPostsInteractor.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class ViewPostsInteractor: ViewPostsInteractorInputProtocol {
    
    var viewModel: ViewPostsInteractorOutputProtocol
    
    init(viewModel: ViewPostsInteractorOutputProtocol) {
        self.viewModel = viewModel
    }
    
    
    func getPosts() {
        NetworkClient.shared.getEntries(completion: {[weak self] posts, error in
            if let unwrappedPosts = posts{
                if unwrappedPosts.status == 1 {
                    self?.viewModel.onSuccess(posts: unwrappedPosts)
                } else {
                    self?.viewModel.onError(error: unwrappedPosts.error ?? "Unknown error")
                }
                
            } else {
                self?.viewModel.onError(error: error ?? "Unknown error")
            }
        })
    }
}
