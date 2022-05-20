//
//  ViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 4/27/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let onboardingView = OnboardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        self.view = onboardingView
        onboardingView.registerAction = clickedRegister
        onboardingView.consultAction = clickedConsult
    }
    
    func clickedRegister() {
        print("Clicou register")
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func clickedConsult() {
        print("Clicou consult")
        //RegisterViewModelNetworking.getAllItems()
        let colsultViewController = ConsultViewController()
        navigationController?.pushViewController(colsultViewController, animated: true)
    }

}

