//
//  RegisterViewModel.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/11/22.
//

import UIKit

class RegisterViewModel: NSObject {
    
    private var conditions: [Bool] = [false, false, false, false, false, true, false, false]
    private var password: String = ""
    
    func getCPF(cpf: String?) -> Bool{
        
        let max = array.count - 1
        guard let text = cpf else {return false}
        var bool = true
        
        if array.count == 0 {
            bool = false
        } else {
            for i in 0...max{
                if text == array[i].cpf{
                    bool = false

                    break
                }
            }
        }
            return bool
        

        }
    
    
    
    func isValid(_ textField: UITextField) -> Bool{
        
        switch textField.tag{
            
        case TextFieldData.nameTextField.rawValue:
            if textField.text?.contains(" ") == true{
                conditions.remove(at: textField.tag)
                conditions.insert(true, at: textField.tag)
            } else {
                conditions.remove(at: textField.tag)
                conditions.insert(false, at: textField.tag)
            }
            
        case TextFieldData.cpfTextField.rawValue:
            if textField.text?.isValidCPF == true && self.getCPF(cpf: textField.text) == true{
                conditions.remove(at: textField.tag)
                conditions.insert(true, at: textField.tag)
            } else {
                conditions.remove(at: textField.tag)
                conditions.insert(false, at: textField.tag)
            }
            
        case TextFieldData.emailTextField.rawValue:
            if textField.text?.isValidEmail(textField.text) == true{
                conditions.remove(at: textField.tag)
                conditions.insert(true, at: textField.tag)
            } else {
                conditions.remove(at: textField.tag)
                conditions.insert(false, at: textField.tag)
            }
            
        case TextFieldData.passwordTextField.rawValue:
            guard let text = textField.text else {return false}
            if text.isValidPassword() == true {
                password = text
                conditions.remove(at: textField.tag)
                conditions.insert(true, at: textField.tag)
            } else {
                conditions.remove(at: textField.tag)
                conditions.insert(false, at: textField.tag)
            }
            
        case TextFieldData.confirmPasswordTextField.rawValue:
            if textField.text == password{
                conditions.remove(at: textField.tag)
                conditions.insert(true, at: textField.tag)
            } else {
                conditions.remove(at: textField.tag)
                conditions.insert(false, at: textField.tag)
            }
            
        case TextFieldData.incomeTextField.rawValue:
            if textField.text == "Selecionar" {
                conditions.remove(at: textField.tag)
                conditions.insert(false, at: textField.tag)
            } else {
                conditions.remove(at: textField.tag)
                conditions.insert(true, at: textField.tag)
            }
            
        case TextFieldData.equityTextField.rawValue:
            if textField.text?.onlyNumbers(text: textField.text) == true{
                conditions.remove(at: textField.tag)
                conditions.insert(true, at: textField.tag)
            } else {
                conditions.remove(at: textField.tag)
                conditions.insert(false, at: textField.tag)
            }
        default:
            
            break
        }
               
        let confirm = conditions.allSatisfy({$0 == true})
        
        return confirm
    }
}
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
    
    func isValidEmail(_ email: String?) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword() -> Bool {
        
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        
        return passwordCheck.evaluate(with: password)
    }
    
    
    
    func onlyNumbers(text: String?) -> Bool {
        guard let _text = text else {return false}
        
        let numbersSet = CharacterSet(charactersIn: "0123456789")
        
        let textCharacter = CharacterSet(charactersIn: _text)
        
        if textCharacter.isSubset(of: numbersSet){
            
            return true
            
        } else {
            
            return false
        }
    }
}

