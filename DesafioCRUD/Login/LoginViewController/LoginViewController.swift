//
//  LoginViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView() {
        self.view = loginView
        loginView.loginAction = pressBtLogin
    }
    
    func pressBtLogin() {
        print("apertou login")
        LoginViewModel.executeLogin(ag: loginView.setupAgTextField(), account: loginView.setupAcTextField() ?? -1, password: loginView.setupPasswordTextField())
    
    }
    
}

