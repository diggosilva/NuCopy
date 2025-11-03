//
//  ViewController.swift
//  NuCopy
//
//  Created by Diggo Silva on 30/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let viewModel = HomeViewModel()
    
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
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.cellModelForRow(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath)
        
        switch cellType {
        case .header(let model):
            model.configure(cell, delegate: self)
            return cell

        case .name(let model):
            model.configure(cell, delegate: self)
            return cell
            
        case .account(let model):
            model.configure(cell, delegate: self)
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellType = viewModel.cellModelForRow(at: indexPath.row)
        
        switch cellType {
        case .header(_):
            print("Header tapped")
        case .name(_):
            print("Name tapped")
        case .account(_):
            print("Account tapped")
        }
    }
}

extension HomeViewController: CellCommonActionsDelegate {
    func didTapEyeButton(in cell: HeaderCell) {
        print("Eye button tapped")
    }
    
    func didTapHelpButton(in cell: HeaderCell) {
        print("Help button tapped")
    }
    
    func didTapVerifyButton(in cell: HeaderCell) {
        print("Verify button tapped")
    }
}
