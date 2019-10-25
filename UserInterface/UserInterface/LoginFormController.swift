//
//  ViewController.swift
//  UserInterface
//
//  Created by Elena Kandalova on 25/10/2019.
//  Copyright © 2019 Elena Kandalova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var loginInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBAction func pressButton(_ sender: Any) {
    }
    
       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
           
           let tapGR = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
           view.addGestureRecognizer(tapGR)
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           NotificationCenter.default.addObserver(self, selector: #selector(willShowKeybord(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
           
            NotificationCenter.default.addObserver(self, selector: #selector(willHideKeybord(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
       }
       
       override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
       }

       @objc func willShowKeybord(_ notification: Notification) {
           guard let info = notification.userInfo as NSDictionary?,
               let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else { return }
           
           let keyboardHeight = keyboardSize.cgRectValue.size.height
           scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
       }
       
       @objc func willHideKeybord(_ notification: Notification) {
           scrollView.contentInset = .zero
       }
       
       @objc func viewTapped(){
           view.endEditing(true)
       }
       
       deinit {
           //
       }
       /*
       // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
       */

   }



