//
//  ViewController.swift
//  2.1_Goncharenko_Ekaterina
//
//  Created by user on 03.08.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func registrationDidPressed(_ sender: Any) {
        if LoginTextField.text == "admin" && passwordTextField.text == "123456" {
            print("You are abble to login")
        } else {
            print("Not able to login")
        }
    }
}

