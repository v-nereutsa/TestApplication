//
//  ViewFullPostViewController.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import UIKit

class ViewFullPostViewController: UIViewController {

    @IBOutlet weak var addedDate: UILabel!
    @IBOutlet weak var modificationDate: UILabel!
    @IBOutlet weak var textView: UITextView!
    var post: Post?
    lazy var viewModel: ViewFullPostOutputProtocol = ViewFullPostViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let da = viewModel.formatDate(date: post?.da)
        let dm = viewModel.formatDate(date: post?.dm)
        addedDate.text = da
        modificationDate.text = da != dm ? dm:"Not modified"
        textView.text = post?.text
    }

}
