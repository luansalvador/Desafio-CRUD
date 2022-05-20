//
//  RegisterViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/27/22.
//

import UIKit

class RegisterView: UIView {
    
    
    private lazy var tableView: UITableView = {
        //Registrei o delegate na ViewController atraves da funcao setupTableViewDelegate aqui abaixo
        let view = UITableView(frame: .zero, style: .plain)
        view.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.identifier)
        view.register(RegisterDatePickerCell.self, forCellReuseIdentifier: RegisterDatePickerCell.identifier)
        view.register(RegisterIncomePickerViewCell.self, forCellReuseIdentifier: RegisterIncomePickerViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false        
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        setupAditionalConfigurations()
        //tableView.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupAditionalConfigurations() {
        self.backgroundColor = .white
    }
    
    public func setupTableView() {
        self.tableView.endEditing(true)
    }
    
    public func setupTableViewDelegate(parent: UITableViewDelegate & UITableViewDataSource) {
        self.tableView.delegate = parent
        self.tableView.dataSource = parent
    }
    
    // MARK: - Funcao para pegar qual row eu quero acessar da tabela dinamica
  /* func getTextFieldValues() {
        self.tableView.cellForRow(at: IndexPath(row: <#T##Int#>, section: <#T##Int#>))
    }*/
}
