//
//  RegisterTableViewCell.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/28/22.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    
    static let identifier: String = "RegisterTableViewCell"
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.minimumScaleFactor = 0.5
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.textColor = .systemPink
        view.placeholder = "Adicionar texto"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(label)
        self.contentView.addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.label.widthAnchor.constraint(equalToConstant: 115),
            
            self.textField.centerYAnchor.constraint(equalTo: self.label.centerYAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 8),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
            
        ])
    }
}

extension RegisterTableViewCell: ConfigurableCellProtocol {
    func configureCell(text: String?,
                       tag: Int,
                       parent: UITextFieldDelegate?) {
        self.label.text = text
        self.textField.tag = tag
        self.textField.delegate = parent
    }
    
    
}
