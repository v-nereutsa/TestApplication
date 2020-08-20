//
//  ViewPostsViewController.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import UIKit

class ViewPostsViewController: UIViewController, ViewPostsInputProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var viewModel: ViewPostsOutputProtocol = ViewPostsViewModel(view: self)
    
    var posts: Posts?
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestPosts()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.tableFooterView = UIView()
    }
    
    func updatePosts(posts: Posts) {
        self.posts = posts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Try again", style: .default) {  (_) -> Void in
                self.viewModel.requestPosts()
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewFullPostViewController {
            let vc = segue.destination as? ViewFullPostViewController
            vc?.post = self.post
        }
    }
    
}

extension ViewPostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.data?[0].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
        cell.selectionStyle = .none
        let post = posts?.data?[0][indexPath.row]
        
        cell.configure(addedDate: post?.da, modificationDate: post?.dm, text: post?.body)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let index = indexPath.row
        post = Post(text: posts?.data?[0][index].body, da: posts?.data?[0][index].da, dm: posts?.data?[0][index].dm)
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "showEntrySegue", sender: self)
        }
    }
    
}
