//
//  LoginViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/2/22.
//

import UIKit

class ConsultViewController: UIViewController {
        
    let consultView = ConsultView()
    let consultTableViewCell = ConsultTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.getAllItems()
        self.title = "Consultar dados"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        setupView()
    }
    
    private func setupView() {
        consultView.setupConsultTableViewDelegate(parent: self)
        self.view = consultView
    }
    
    private func clickedEdit() {
        print("CLICOU EDIT")
    }
}

extension ConsultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = array[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ConsultTableViewCell.identifier, for: indexPath) as? ConsultTableViewCell
        cell?.configureTableView(text: model.name)
        cell?.editAction = clickedEdit
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            Networking.deleteItem(item: array[indexPath.row])
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
