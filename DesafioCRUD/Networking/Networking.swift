//
//  RegisterViewModel.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/4/22.
//

import UIKit


class Networking {
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //deixar a variavel private e criar protocolo para trabalhar com ela
    static var newClient: Clientes = Clientes(name: "", cpf: "", email: "", equity: "", income: "", birthDate: Date(), password: "", confirmPassword: "", account: 0, agency: "0001-9")
    
    static func newRegister(_ textField: UITextField) {
        
        switch textField.tag {
            case TextFieldData.nameTextField.rawValue:
                Networking.newClient.name = textField.text
            case TextFieldData.cpfTextField.rawValue:
                Networking.newClient.cpf = textField.text
            case TextFieldData.emailTextField.rawValue:
                Networking.newClient.email = textField.text
            case TextFieldData.equityTextField.rawValue:
                Networking.newClient.equity = textField.text
            case TextFieldData.incomeTextField.rawValue:
                Networking.newClient.income = textField.text
            case TextFieldData.birthDateTextField.rawValue:
                Networking.newClient.birthDate = Date()
            case TextFieldData.passwordTextField.rawValue:
                Networking.newClient.password = textField.text
            case TextFieldData.confirmPasswordTextField.rawValue:
                Networking.newClient.confirmPassword = textField.text
            default:
                break            
        }
        
        if array.count == 0 {
            Networking.newClient.account = 1
        } else {
            Networking.newClient.account = Int64(array.count + 1)
        }
    }
    
    static func getAllItems() {
        do {
            array = try Networking.context.fetch(Client.fetchRequest())
            DispatchQueue.main.async {
                //print(array)
                //self.consultView.tableView.reloadData()                
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    static func createItem() {
        
     
        
        let newItem = Client(context: Networking.context)
        newItem.name = newClient.name
        newItem.cpf = newClient.cpf
        newItem.email = newClient.email
        newItem.equity = newClient.equity
        newItem.income = newClient.income
        newItem.birthDate = newClient.birthDate
        newItem.password = newClient.password
        newItem.confirmPassword = newClient.confirmPassword
        newItem.account = newClient.account
        newItem.agency = newClient.agency
        
        do {
            try Networking.context.save()
            getAllItems()
            print("criou cliente")
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    static func deleteItem(item: Client) {
        
        Networking.context.delete(item)
        do {
            try Networking.context.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func updateItem(item: Client,
                    updatedEmail: String,
                    updatedEquity: String,
                    updatedIncome: String,
                    updatedPassword: String){
       
        item.email = updatedEmail
        //item.equity = updatedEquity
        item.income = updatedIncome
        item.password = updatedPassword        
    }
}
