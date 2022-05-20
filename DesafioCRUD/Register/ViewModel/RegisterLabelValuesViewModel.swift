//
//  RegisterViewModel.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/3/22.
//
import UIKit
import CoreData

enum RegisterLabelValues: String, CaseIterable {
    case name = "Nome Completo"
    case cpf = "CPF"
    case email = "E-mail"
    case equity = "Patrimônio Líquido"
    case income = "Renda Mensal"
    case birthDate = "Data de Nascimento"
    case password = "Senha"
    case confirmPassword = "Confirmar Senha"
}

// Verificacoes 
/*
protocol RegisterViewModelDelegate: AnyObject {
    func displayAlert(title: String, message: String)
    
    func displayAlertAction(title: String, message: String)
    
    func popView()
}

protocol RegisterViewModeling {
    var delegate: RegisterViewModelDelegate? { get set }
    func displayAlert(title: String, message: String)
    func displayAlertAction(title: String, message: String)
}


final class RegisterViewModel {
    //var newClient = Clientes(name: "", cpf: "", email: "", equity: "", income: "", birthDate: Date(), password: "", confirmPassword: "")
     
    var networking = Networking()
    
    weak var delegate: RegisterViewModelDelegate?
    
    var newClientVerify: [Clientes] = []
    
    func addClient() {
        //print(newClient)
        newClientVerify.append(networking.newClient)
        //newClientVerify.append(newClient)
        var newClient = newClientVerify[0]
        
        let verifyTf = verifyTextField(newClient: newClient)
        let verifyEmail = verifyEmail(email: newClient.email ?? "")
        let verifyCpf = verifyCpf(cpf: newClient.cpf ?? "")
        
        if verifyTf == true && verifyCpf == true && verifyEmail == true {
            networking.createItem()
            delegate?.displayAlertAction(title: "Sucesso", message: "Cadastro concluido")
        }
    }
    
    
    func verifyTextField(newClient: Clientes) -> Bool{
        if  newClient.cpf == "" || newClient.name == "" || newClient.email == "" || newClient.equity == "" || newClient.password == "" || newClient.confirmPassword == ""{
            print("preencha todos os campos")
            delegate?.displayAlertAction(title: "Erro", message: "Preencha todos os campos")
            return false
        } else {
            
        return true
            
        }
    }
    
    func verifyEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let validate = emailPred.evaluate(with: email)
        
        if validate == true {
            return true
        } else {
            print("email invalido")
            self.delegate?.displayAlert(title: "Erro", message: "E-mail Inválido")
            return false
        }
    }
    
    func verifyCpf(cpf: String) -> Bool {
        let cpfVerify = cpf.isValidCPF
        
        if cpfVerify == true {
            return true
        } else {
            print("cpf invalido")
            self.delegate?.displayAlert(title: "Erro", message: "CPF Inválido")
            return false
        }
    }
}



extension RegisterViewModel: RegisterViewModeling {
    
    func displayAlert(title: String, message: String) {
        self.delegate?.displayAlert(title: title, message: message)
    }
    
    func displayAlertAction(title: String, message: String) {
        self.delegate?.displayAlertAction(title: title, message: message)
    }
    
    func popView() {
        self.delegate?.popView()
    }
}

//MARK: - CPF validation
extension Collection where Element == Int {
    var digitoCPF: Int {
        var number = count + 2
        let digit = 11 - reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
}

extension StringProtocol {
    var isValidCPF: Bool {
        let numbers = compactMap(\.wholeNumberValue)
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        return numbers.prefix(9).digitoCPF == numbers[9] &&
        numbers.prefix(10).digitoCPF == numbers[10]
    }
}
*/
