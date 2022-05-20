//
//  ConfigurableCellProtocol.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/4/22.
//

import UIKit

protocol ConfigurableCellProtocol {
    func configureCell(text: String?,
                       tag: Int,
                       parent: UITextFieldDelegate?)
}
