//
//  AddScreenViewController.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import UIKit

class AddScreenViewController: UIViewController, AddSreenInputProtocol {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    
    lazy var viewModel: AddScreenOutputProtocol = AddScreenViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.text = "Enter your text"
        textView.textColor = UIColor.lightGray
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddScreenViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    // Отмена добавления записи
    @IBAction func cancelAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    // Добавить запись
    @IBAction func saveAction(_ sender: Any) {
        view.endEditing(true)
        viewModel.addPost(text: textView.text)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            textViewBottomConstraint.constant += keyboardHeight
        }
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        textViewBottomConstraint.constant = 0
    }
    
    func showSuccessAlert() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Success", message: "Entry added!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) {  (_) -> Void in
                self.textView.text = "Enter your text"
                self.textView.textColor = UIColor.lightGray
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showError(error: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Try again", style: .default) {  (_) -> Void in
                self.viewModel.addPost(text: self.textView.text)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}

extension AddScreenViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let range = NSMakeRange(textView.text.count - 1, 0)
        textView.scrollRangeToVisible(range)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter your text"
            textView.textColor = UIColor.lightGray
        }
    }
}
