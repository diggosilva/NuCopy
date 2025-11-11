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
        tableView.register(ExtraMoneyCell.self, forCellReuseIdentifier: ExtraMoneyCell.identifier)
        tableView.register(InviteCardTableCell.self, forCellReuseIdentifier: InviteCardTableCell.identifier)
        tableView.register(DividerCell.self, forCellReuseIdentifier: DividerCell.identifier)
        tableView.register(CreditCardCell.self, forCellReuseIdentifier: CreditCardCell.identifier)
        tableView.register(MyCardsCell.self, forCellReuseIdentifier: MyCardsCell.identifier)
        tableView.register(LoanCell.self, forCellReuseIdentifier: LoanCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.cellModelForRow(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath)
        
        switch cellType {
        case .header(let model):
            if let headerCell = cell as? HeaderCell {
                headerCell.configure(model: model)
                headerCell.delegate = self
            }
            return cell

        case .name(let model):
            if let nameCell = cell as? NameCell {
                nameCell.configure(model: model)
            }
            return cell
            
        case .account(let model):
            if let accountCell = cell as? AccountCell {
                accountCell.configure(with: model)
            }
            return cell
            
        case .shortcuts(let model):
            if let shortcutCell = cell as? ShortcutTableCell {
                shortcutCell.configure(with: model.shortcuts)
                shortcutCell.delegate = self
            }
            return cell
            
        case .extraMoney(let model):
            if let extraMoneyCell = cell as? ExtraMoneyCell {
                extraMoneyCell.configure(model: model)
            }
            return cell
            
        case .invite(let model):
            if let inviteCell = cell as? InviteCardTableCell {
                inviteCell.configure(with: model.inviteItems)
                inviteCell.delegate = self
            }
            return cell
            
        case .divider(let model):
            if let dividerCell = cell as? DividerCell {
                dividerCell.configure(model: model)
            }
            return cell
        
        case .creditCard(let model):
            if let creditCardCell = cell as? CreditCardCell {
                creditCardCell.configure(with: model)
            }
            return cell
            
        case .myCards(let model):
            if let myCardsCell = cell as? MyCardsCell {
                myCardsCell.configure(with: model)
            }
            return cell
            
        case .loan(let model):
            if let loanCell = cell as? LoanCell {
                loanCell.configure(with: model)
            }
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
            
        case .extraMoney(_):
            print("Extra Money tapped")
        
        case .invite(_):
            print("Invite tapped")
        
        case .divider(_):
            print("Division tapped")
        
        case .creditCard(_):
            print("Credit Card tapped")
        
        case .myCards(_):
            print("My Cards tapped")
        
        case .loan(_):
            print("Loan tapped")
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
    
    func didSelectShortcut(in cell: ShortcutTableCell, at indexPath: IndexPath) {
        print("Shortcut \(indexPath.item) da Collection tocado na célula \(tableView.indexPath(for: cell)?.row ?? 0)")
    }
    
    func didSelectInvite(in cell: InviteCardTableCell, at indexPath: IndexPath) {
        print("Invite \(indexPath.item) da Collection tocado na célula \(tableView.indexPath(for: cell)?.row ?? 0)")
    }
}
