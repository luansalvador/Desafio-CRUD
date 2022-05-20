//
//  RegisterViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/28/22.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    let registerView = RegisterView()
    let registerFooterView = RegisterFooterView()
    let registerTableViewlCell = RegisterTableViewCell()
    let registerViewModel = RegisterViewModel()
    var isValid: Bool = false
   // let registerViewModelController = RegisterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastrar dados"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        setupView()
        setupFooterView()
        let container = NSPersistentContainer(name: "DesafioCRUD")
        print("Diretorio do core data: \(String(describing: container.persistentStoreDescriptions.first!.url))")
    }
    
    private func setupView() {
        registerView.setupTableViewDelegate(parent: self)
        self.view = registerView        
    }

    private func setupFooterView() {
        registerFooterView.registerAction = clickedRegister
    }
    
    func clickedRegister() {
        
        registerView.setupTableView()
        //if self.isValid == true {
            
            Networking.createItem()
            navigationController?.popViewController(animated: true)
            print(array)
            print("deu conta criada")
       // } else {
            //print("deu errado")
        //}
    }
    
    public func setupTableView(tableView: UITableView) {
        
    }

}
extension RegisterViewController: UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RegisterLabelValues.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
    switch indexPath.row {
        
        case 5:
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterDatePickerCell.identifier, for: indexPath) as? RegisterDatePickerCell
            let text = RegisterLabelValues.allCases[indexPath.row].rawValue
            cell?.configureCell(text: text, tag: indexPath.row, parent: self)
            cell?.selectionStyle = .none
            
            return cell ?? UITableViewCell()
        
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: RegisterIncomePickerViewCell.identifier, for: indexPath) as? RegisterIncomePickerViewCell
            let text = RegisterLabelValues.allCases[indexPath.row].rawValue
            cell?.configureCell(text: text, tag: indexPath.row, parent: self)
            cell?.selectionStyle = .none
            
            return cell ?? UITableViewCell()
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier, for: indexPath) as? RegisterTableViewCell
            let text = RegisterLabelValues.allCases[indexPath.row].rawValue
            cell?.configureCell(text: text, tag: indexPath.row, parent: self)
            cell?.selectionStyle = .none
            
            return cell ?? UITableViewCell()
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        RegisterFooterView.height
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //let footer = self.registerFooterView
        //footer.registerViewModelFooter = registerViewModelController
        //return footer
        return registerFooterView
    }
}

extension RegisterViewController: UITextFieldDelegate  {
  
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingDidEnd)
    }
    
    @objc func valueChanged(_ textField: UITextField) {
        if registerViewModel.isValid(textField) == true {
            self.isValid = true
        } else {
            self.isValid = false
        }
        /*self.registerViewModelNetworking/Users/user220212/Desktop/Projetos Xcode/DesafioCRUD/DesafioCRUD/Register/ViewController/RegisterViewController.swift.newRegister(textField)*/
        Networking.newRegister(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

/*extension RegisterViewController: RegisterViewModelDelegate {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func displayAlertAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in self.popView()}))
            present(alert, animated: true)
    }
    
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}*/
