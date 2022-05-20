//
//  EditTableViewCell.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/9/22.
//

import UIKit

class EditTableViewCell: UITableViewCell {
    
    static var identifier = "EditTableViewCell"
    
    private lazy var emailLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newEmailLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Insira o novo e-mail"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(newEmailLabel)
        self.contentView.addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.emailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            self.newEmailLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 4),
            self.newEmailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.newEmailLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            
            self.textField.centerYAnchor.constraint(equalTo: self.newEmailLabel.centerYAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.newEmailLabel.trailingAnchor, constant: 8),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
        
    }
}

extension EditTableViewCell: ConfigurableCellProtocol {
    func configureCell(text: String?, tag: Int, parent: UITextFieldDelegate?) {
        self.emailLabel.text = text
        self.textField.tag = tag
        self.textField.delegate = parent
    }
}
