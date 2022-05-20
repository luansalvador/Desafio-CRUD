//
//  LoginView.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/12/22.
//

import UIKit

class LoginView: UIView {
    
    var loginAction: (() -> Void)?
    
    private lazy var agLabel: UILabel = {
        let view = UILabel()
        view.text = "Agência com dígito"
        view.textColor = .white
        view.font = view.font.withSize(15)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountLabel: UILabel = {
        let view = UILabel()
        view.text = "Conta com dígito"
        view.textColor = .white
        view.font = view.font.withSize(15)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let view = UILabel()
        view.text = "Senha(6 Dígitos)"
        view.textColor = .white
        view.font = view.font.withSize(15)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var agTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Agência"
        view.textColor = .systemPink
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Conta"
        view.textColor = .systemPink
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "4CRUD"
        view.textColor = .white
        view.font = UIFont.boldSystemFont(ofSize: 50)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.textColor = .systemPink
        view.placeholder = "Senha"
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.isSecureTextEntry = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("Entrar", for: .normal)
        view.setTitleColor(UIColor.systemPink, for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 9
        view.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        setupAdtionalConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(agTextField)
        self.addSubview(accountTextField)
        self.addSubview(button)
        self.addSubview(passwordTextField)
        self.addSubview(titleLabel)
        self.addSubview(agLabel)
        self.addSubview(accountLabel)
        self.addSubview(passwordLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.bottomAnchor.constraint(equalTo: self.agTextField.topAnchor, constant: -80),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            self.agLabel.leadingAnchor.constraint(equalTo: self.agTextField.leadingAnchor),
            self.agLabel.bottomAnchor.constraint(equalTo: self.agTextField.topAnchor, constant: -3),
            self.agLabel.widthAnchor.constraint(equalTo: self.agTextField.widthAnchor),
                        
            self.agTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.agTextField.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -5),
            self.agTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.42),
            self.agTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.accountLabel.leadingAnchor.constraint(equalTo: self.accountTextField.leadingAnchor),
            self.accountLabel.bottomAnchor.constraint(equalTo: self.accountTextField.topAnchor, constant: -3),
            self.accountLabel.widthAnchor.constraint(equalTo: self.accountTextField.widthAnchor),
            
            self.accountTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.accountTextField.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 5),
            self.accountTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.42),
            self.accountTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.passwordLabel.bottomAnchor.constraint(equalTo: self.passwordTextField.topAnchor, constant: -3),
            self.passwordLabel.widthAnchor.constraint(equalTo: self.passwordTextField.widthAnchor),
            self.passwordLabel.topAnchor.constraint(equalTo: self.agTextField.bottomAnchor, constant: 3),
            
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.agTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.accountTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.button.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 16),
            self.button.heightAnchor.constraint(equalToConstant: 40),
            self.button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6)
            
        ])
    }
    
    private func setupAdtionalConfig() {
        self.backgroundColor = .systemPink
    }
    
    public func configureParent(parent: UITextFieldDelegate?) {
        self.agTextField.delegate = parent
        self.passwordTextField.delegate = parent
        self.accountTextField.delegate = parent
    }
    
   /* public func setupAccountParent(parent: UITextFieldDelegate) {
        self.accountTextField.delegate = parent
    }*/
    
   public func setupAgTextField() -> String {
        let agencia = self.agTextField.text!
        
        return agencia
    }
    
    public func setupAcTextField() -> Int64? {
        let account = self.accountTextField.text!
        let accountConvert = Int64(account)
       
        
        return accountConvert
    }
    
    public func setupPasswordTextField() -> String {
        let password = self.passwordTextField.text!
        
        return password
    }
    
    @objc private func performLogin() {
        self.loginAction?()
    }
}

