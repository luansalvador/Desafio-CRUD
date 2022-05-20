//
//  ConsultTableViewCell.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/5/22.
//

import UIKit

class ConsultTableViewCell: UITableViewCell {
    
    static let identifier: String = "ConsultTableViewCell"
    var editAction: (() -> Void)?
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "pencil"), for: .normal)
        view.addTarget(self, action: #selector(self.performEdit), for: .touchUpInside)
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
        self.contentView.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.label.widthAnchor.constraint(equalToConstant: 115),
            
            self.button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.button.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            self.button.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func performEdit() {
        self.editAction?()
    }
}

extension ConsultTableViewCell: ConfigurableTableViewProtocol  {
    func configureTableView(text: String?) {
        self.label.text = text
    }
}
