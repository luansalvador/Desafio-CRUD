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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as? CardTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    
    
}
