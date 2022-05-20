//
//  EditView.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/9/22.
//

import UIKit

class EditView: UIView {
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(EditTableViewCell.self, forCellReuseIdentifier: EditTableViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints
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
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupAdtionalConfig() {
        self.backgroundColor = .white
    }
    
    public func setupEditTableViewDelegate(parent: UITableViewDelegate & UITableViewDataSource) {
        self.tableView.delegate = parent
        self.tableView.dataSource = parent
    }
}
