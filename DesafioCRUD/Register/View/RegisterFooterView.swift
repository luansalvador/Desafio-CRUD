//
//  RegisterFooterView.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/29/22.
//

import UIKit

class RegisterFooterView: UIView {
    
    //weak var registerViewModelFooter: RegisterViewModel?
    
    var registerAction: (() -> Void)?
    
    static let height: CGFloat = 100
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("CADASTRAR", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 9
        view.addTarget(self, action: #selector(performRegister), for: .touchUpInside)
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
        self.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func performRegister() {
        self.registerAction?()
        //self.registerViewModelFooter?.addClient()
    }
    
    
}
