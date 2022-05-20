//
//  RegisterIncomeDatePickerCell.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/28/22.
//

import UIKit

class RegisterIncomePickerViewCell: UITableViewCell {
        
    static let identifier: String = "RegisterIncomePickerViewCell"
    
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
        view.inputView = pickerView
        view.text = "Selecionar"
        view.textAlignment = .center
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 9
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pickerView: UIPickerView = {
        let view = UIPickerView()
        view.tintColor = .systemPink
        view.delegate = self
        view.dataSource = self
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
            
            self.textField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            
            self.textField.centerYAnchor.constraint(equalTo: self.label.centerYAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 8),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
}

extension RegisterIncomePickerViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RegisterIncomeDatePickerView.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return RegisterIncomeDatePickerView.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.text = RegisterIncomeDatePickerView.allCases[row].rawValue
        self.textField.resignFirstResponder()        
    }
}

extension RegisterIncomePickerViewCell: ConfigurableCellProtocol {
    func configureCell(text: String?,
                       tag: Int,
                       parent: UITextFieldDelegate?) {
        self.label.text = text
        self.textField.tag = tag
        self.textField.delegate = parent
    }
    
    
}

