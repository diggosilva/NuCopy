//
//  ViewController.swift
//  NuCopy
//
//  Created by Diggo Silva on 30/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let cellItems: [HomeCell] = [.header, .name, .account]
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .roxinho
        configureDataSourcesAndDelegates()
    }
    
    private func configureDataSourcesAndDelegates() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellItems[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath)
                
        switch cellType {
        case .header:
            guard let headerCell = cell as? HeaderCell else { return UITableViewCell() }
            return headerCell
            
        case .name:
            guard let nameCell = cell as? NameCell else { return UITableViewCell() }
            return nameCell
        
        case .account:
            guard let accountCell = cell as? AccountCell else { return UITableViewCell() }
            return accountCell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
