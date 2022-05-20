//
//  LoginViewModel.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/13/22.
//

import UIKit
import CoreData

class LoginViewModel: NSObject {
    

    static func executeLogin(ag: String, account: Int64, password: String) -> Bool {
        
      
       let fetchRequest: NSFetchRequest<Client>
       fetchRequest = Client.fetchRequest()
       
       fetchRequest.predicate = NSPredicate(format: "account = %d", account)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        
        
        do {
            let object = try context.fetch(fetchRequest)
            //if object.count > 0 {
            guard let objectEntity: Client = object.first as? Client  else { return  false }
            if objectEntity.agency == ag && Int64(objectEntity.account) == account && objectEntity.password == password {
                print("deu certo")
                return true
            } else {
                print("login ou senha incorretos")
                return false
                }
            /*} else {
                print("login ou senha incorretos 2")
                return false
            }*/
        } catch {
            print("caiu catch")
            return false
        }
        
        
      /*  print("chamou a funcao")
        
        var indice: Int = 0
        
        agencia = loginView.setupAgTextField()
        loginAccount = loginView.setupAcTextField()
        
        let loginAccountInt = Int64(self.loginAccount)
        guard let loginAccountInt64 = loginAccountInt else {  return print("caiu aqui")}
        //print(loginAccountInt64)
        
        //let loginAccountString = String(loginAccountInt64)
        
        if agencia == "" || loginAccount == "" {
            print("Os campos estao vazios")
        } else {
            let count: Int = array.count - 1
            for i in 0...count {
                if loginAccountInt64 == array[i].account {
                    indice = i
                } else {
                    print("perdeu aqui")
                }
            }
        }
        
        if agencia == "0001-9" && loginAccountInt64 == array[indice].account {
            print("sucesso no login")
        } else {
            print("dados incorretos")
        }*/
    }
}
