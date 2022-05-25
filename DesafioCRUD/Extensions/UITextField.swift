//
//  UITextField.swift
//  DesafioCRUD
//
//  Created by user220212 on

import UIKit

extension UITextField {
    func setUnderlineBorder() {
        let border = CALayer()
        let defaultWidth = UIScreen.main.bounds.width * 0.30
        border.borderColor = UIColor.init(red: 0.5, green: 0.67, blue: 0.98, alpha: 1).cgColor
        border.borderWidth = 1
        border.frame = CGRect(x: -10, y: 25, width: defaultWidth, height: 0.7)
        self.layer.addSublayer(border)
        
    }
}
