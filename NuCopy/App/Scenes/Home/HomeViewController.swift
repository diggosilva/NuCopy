//
//  ViewController.swift
//  NuCopy
//
//  Created by Diggo Silva on 30/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let items: [HomeCell] = [
        .header(
            HeaderCellModel(
                image: UIImage(systemName: "person.crop.circle"),
                onEyeTapped: { print("eye tapped") },
                onHelpTapped: { print("help tapped") },
                onVerifyTapped: { print("verify tapped") }
            ),
        ),
        .name(
            NameCellModel(username: "John Doe")
        ),
        .account
    ]
    
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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath)
        
        switch cellType {
        
        case .header(let model):
            model.configure(cell)
            return cell

        case .name(let model):
            model.configure(cell)
            return cell
            
        case .account:
            break
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
