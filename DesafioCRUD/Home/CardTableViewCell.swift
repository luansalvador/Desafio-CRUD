//
//  CardCell.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/24/22.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    static let identifier: String = "CardTableViewCell"
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "My Name"
        view.font = UIFont.systemFont(ofSize: 36)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        view.tintColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pixButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .systemGray5
        view.setTitle("PIX", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
        view.setImage(UIImage(systemName: "circle.grid.cross.fill"), for: .normal)
        view.layer.cornerRadius = 9
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var paymentButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .systemGray5
        view.setTitle("PAGAR", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
        view.setImage(UIImage(systemName: "barcode"), for: .normal)
        view.layer.cornerRadius = 9
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var transferButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .systemGray5
        view.setTitle("TRANSFERIR", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
        view.setImage(UIImage(systemName: "dollarsign.circle.fill"), for: .normal)
        view.layer.cornerRadius = 9
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 9
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var balanceLabel: UILabel = {
        let view = UILabel()
        view.text = "Saldo"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var balanceValueLabel: UILabel = {
        let view = UILabel()
        view.text = "R$ 999.00"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var fadeEyeButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var agLabel: UILabel = {
        let view = UILabel()
        view.text = "Agência: 1-9"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountLabel: UILabel = {
        let view = UILabel()
        view.text = "Conta: 1"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 14)
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
        self.addSubview(label)
        self.addSubview(photoButton)
        self.addSubview(pixButton)
        self.addSubview(paymentButton)
        self.addSubview(transferButton)
        self.addSubview(cardView)
        self.addSubview(balanceLabel)
        self.addSubview(balanceValueLabel)
        self.addSubview(fadeEyeButton)
        self.addSubview(agLabel)
        self.addSubview(accountLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.label.trailingAnchor.constraint(equalTo: self.photoButton.leadingAnchor, constant: -8),
            
            self.photoButton.centerYAnchor.constraint(equalTo: self.label.centerYAnchor),
            self.photoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.photoButton.heightAnchor.constraint(equalToConstant: 37),
            self.photoButton.widthAnchor.constraint(equalToConstant: 40),
            
            self.pixButton.topAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: 16),
            self.pixButton.trailingAnchor.constraint(equalTo: self.paymentButton.leadingAnchor, constant: -8),
            self.pixButton.heightAnchor.constraint(equalToConstant: 47),
            self.pixButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.28),
            
            self.paymentButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.paymentButton.centerYAnchor.constraint(equalTo: self.pixButton.centerYAnchor),
            self.paymentButton.heightAnchor.constraint(equalTo: self.pixButton.heightAnchor),
            self.paymentButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.28),
            
            self.transferButton.centerYAnchor.constraint(equalTo: self.pixButton.centerYAnchor),
            self.transferButton.leadingAnchor.constraint(equalTo: self.paymentButton.trailingAnchor, constant: 8),
            self.transferButton.heightAnchor.constraint(equalTo: self.pixButton.heightAnchor),
            self.transferButton.widthAnchor.constraint(equalTo: self.pixButton.widthAnchor),
            
            self.cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.cardView.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 16),
            self.cardView.heightAnchor.constraint(equalToConstant: 173),
            
            self.balanceLabel.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: 16),
            self.balanceLabel.topAnchor.constraint(equalTo: self.cardView.topAnchor, constant: 16),
            self.balanceLabel.widthAnchor.constraint(equalToConstant: 70),
            
            self.balanceValueLabel.leadingAnchor.constraint(equalTo: self.balanceLabel.leadingAnchor),
            self.balanceValueLabel.centerYAnchor.constraint(equalTo: self.cardView.centerYAnchor),
            self.balanceValueLabel.widthAnchor.constraint(equalToConstant: 150),
            
            self.fadeEyeButton.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor, constant: -16),
            self.fadeEyeButton.centerYAnchor.constraint(equalTo: self.balanceLabel.centerYAnchor),
            
            self.agLabel.bottomAnchor.constraint(equalTo: self.cardView.bottomAnchor, constant: -16),
            self.agLabel.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor, constant: 16),
            self.agLabel.widthAnchor.constraint(equalToConstant: 100),
            
            self.accountLabel.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor, constant: 16),
            self.accountLabel.centerYAnchor.constraint(equalTo: self.agLabel.centerYAnchor),
            self.accountLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
