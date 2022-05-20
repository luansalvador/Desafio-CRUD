//
//  EditViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/9/22.
//

import UIKit

class EditViewController: UIViewController {
    
    var editView = EditView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = editView
    }

}

extension EditViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LabelValues.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = array[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: EditTableViewCell.identifier, for: indexPath) as? EditTableViewCell
        cell?.configureCell(text: model.email!, tag: indexPath.row, parent: self)        
        return cell ?? UITableViewCell()
    }
    
    
}

extension EditViewController: UITextFieldDelegate {
    
}
