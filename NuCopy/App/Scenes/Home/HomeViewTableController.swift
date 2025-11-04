//
//  HomeViewTableController.swift
//  NuCopy
//
//  Created by Diggo Silva on 30/10/25.
//

import UIKit

class HomeViewTableController: UITableViewController {
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .roxinho
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(NameCell.self, forCellReuseIdentifier: NameCell.identifier)
        tableView.register(AccountCell.self, forCellReuseIdentifier: AccountCell.identifier)
        tableView.register(ShortcutTableCell.self, forCellReuseIdentifier: ShortcutTableCell.identifier)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        case .shortcuts(let model):
            model.configure(cell, delegate: self)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellType = viewModel.cellModelForRow(at: indexPath.row)
        
        switch cellType {
        case .header(_):
            print("Header tapped")
        case .name(_):
            print("Name tapped")
        case .account(_):
            print("Account tapped")
        case .shortcuts(_):
            print("TABLE CELL tapped")
        }
    }
}

extension HomeViewTableController: CellCommonActionsDelegate {
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
