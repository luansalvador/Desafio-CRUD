//
//  LoginViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    //let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView() {
        self.view = loginView
        loginView.configureParent(parent: self)
        //loginView.setupAccountParent(parent: self)
        loginView.loginAction = pressBtLogin
    }
    
    func pressBtLogin() {
        print("apertou login")
        LoginViewModel.executeLogin(ag: loginView.setupAgTextField(), account: loginView.setupAcTextField() ?? 10, password: loginView.setupPasswordTextField())
    
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {        
        if textField.text == "Agência" {
            textField.text = ""
        } else if textField.text == "Conta" {
            textField.text = ""
        } else if textField.text == "Senha" {
            textField.text = ""
        }
    }
}
