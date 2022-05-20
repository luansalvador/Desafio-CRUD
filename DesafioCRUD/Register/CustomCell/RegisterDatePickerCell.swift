//
//  RegisterDatePickerCell.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/28/22.
//

import UIKit

class RegisterDatePickerCell: UITableViewCell {
    
    static let identifier: String = "RegisterDatePickerCell"
    
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
        view.inputView = datePicker
        view.text = "Selecionar"
        view.textAlignment = .center
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 9
        view.inputAccessoryView = toolBar
        let secondstoYears: Double = 567648000 + 345600
        let confirmAge = Date(timeIntervalSinceNow: -secondstoYears)
        datePicker.maximumDate = confirmAge
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var toolBar: UIToolbar = {
        let view = UIToolbar()
        view.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        view.setItems([doneButton], animated: true)
        return view
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.backgroundColor = .clear
        view.datePickerMode = .date
        view.tintColor = .systemPink
        view.preferredDatePickerStyle = .wheels        
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
        self.contentView.addSubview(textField)
        self.contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.label.widthAnchor.constraint(equalToConstant: 115),
            
            self.textField.centerYAnchor.constraint(equalTo: self.label.centerYAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 8),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.textField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
        ])
    }
    
    @objc private func donePressed() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: datePicker.date)
        self.textField.text = dateString        
        self.textField.endEditing(true)
    }
}

extension RegisterDatePickerCell: ConfigurableCellProtocol {
    func configureCell(text: String?,
                       tag: Int,
                       parent: UITextFieldDelegate?) {
        self.label.text = text
        self.textField.tag = tag
        self.textField.delegate = parent
    }
        
}
