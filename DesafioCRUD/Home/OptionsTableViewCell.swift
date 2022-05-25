//
//  OptionsTableViewCell.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/25/22.
//

import UIKit

class OptionsTabeViewCell: UITableViewCell {
    
    static let identifier: String = "RegisterTableViewCell"
    
    private lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitleColor(UIColor.black, for: .normal)
        view.tintColor = .systemPink
        view.contentHorizontalAlignment = .leading
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
        self.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)
        ])
    }
    
    public func configurableCell(text: String, image: UIImage) {
        self.button.setTitle(text, for: .normal)
        self.button.setImage(image, for: .normal)
    }
}
