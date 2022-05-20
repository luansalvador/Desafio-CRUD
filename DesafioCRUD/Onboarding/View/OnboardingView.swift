//
//  OnboardingView.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/27/22.
//

import UIKit

class OnboardingView: UIView {
    
    var registerAction: (() -> Void)?
    var consultAction: (() -> Void)?
    
    private lazy var backGroudImage:UIImageView = {
        let view = UIImageView(image: UIImage(named: "onboardingimage"))
        view.translatesAutoresizingMaskIntoConstraints = false        
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("CRIAR CONTA", for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 9
        view.setTitleColor(UIColor.systemPink, for: .normal)
        view.addTarget(self, action: #selector(performRegister), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var consultButton: UIButton = {
        let view = UIButton()
        view.setTitle("CONSULTAR CLIENTES", for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 9
        view.setTitleColor(UIColor.systemPink, for: .normal)
        view.addTarget(self, action: #selector(performConsult), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()    
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(backGroudImage)
        self.addSubview(registerButton)
        self.addSubview(consultButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.backGroudImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backGroudImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backGroudImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backGroudImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.consultButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -85),
            self.consultButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.consultButton.heightAnchor.constraint(equalToConstant: 50),
            self.consultButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            
            self.registerButton.bottomAnchor.constraint(equalTo: self.consultButton.topAnchor, constant: -12),
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50),
            self.registerButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85)
            
        
        ])
        
    }
    
    @objc private func performRegister() {
        self.registerAction?()
    }
    
    @objc private func performConsult() {
        self.consultAction?()
    }
    
}
