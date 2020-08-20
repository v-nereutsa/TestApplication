//
//  ViewController.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MainScreenInputProtocol {

    lazy var viewModel: MainScreenOutputProtocol = MainScreenViewModel(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    func showError(error: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Session request error", message: error, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Try again", style: .default) {  (_) -> Void in
                self.viewModel.viewDidLoad()
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

