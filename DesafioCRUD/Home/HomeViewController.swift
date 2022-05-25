//
//  HomeViewController.swift
//  DesafioCRUD
//
//  Created by user220212 on 5/24/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        homeView.setupTableViewDelegate(parent: self)
        self.view = homeView
        self.title = "Home"
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LabelValuesViewModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as? CardTableViewCell
                cell?.selectionStyle = .none
                
                return cell ?? UITableViewCell()
            
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTabeViewCell.identifier, for: indexPath) as? OptionsTabeViewCell
                let text = LabelValuesViewModel.allCases[indexPath.row].rawValue
                cell?.configurableCell(text: text, image: UIImage(systemName: "creditcard")!)
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
            
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTabeViewCell.identifier, for: indexPath) as? OptionsTabeViewCell
                let text = LabelValuesViewModel.allCases[indexPath.row].rawValue
                cell?.configurableCell(text: text, image: UIImage(systemName: "dollarsign.circle")!)
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
            
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTabeViewCell.identifier, for: indexPath) as? OptionsTabeViewCell
                let text = LabelValuesViewModel.allCases[indexPath.row].rawValue
                cell?.configurableCell(text: text, image: UIImage(systemName: "iphone")!)
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
                
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTabeViewCell.identifier, for: indexPath) as? OptionsTabeViewCell
                let text = LabelValuesViewModel.allCases[indexPath.row].rawValue
                cell?.configurableCell(text: text, image: UIImage(systemName: "bag")!)
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
            
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTabeViewCell.identifier, for: indexPath) as? OptionsTabeViewCell
                let text = LabelValuesViewModel.allCases[indexPath.row].rawValue
                cell?.configurableCell(text: text, image: UIImage(systemName: "heart.text.square")!)
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
            
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: OptionsTabeViewCell.identifier, for: indexPath) as? OptionsTabeViewCell
                let text = LabelValuesViewModel.allCases[indexPath.row].rawValue
                cell?.configurableCell(text: text, image: UIImage(systemName: "square.and.pencil")!)
                cell?.selectionStyle = .none
            
                return cell ?? UITableViewCell()
            
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 320
        } else {
            return 50
        }
    }
    
    
}
