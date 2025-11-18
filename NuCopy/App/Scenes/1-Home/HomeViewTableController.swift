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
        tableView.register(PaymentAssistantCell.self, forCellReuseIdentifier: PaymentAssistantCell.identifier)
        tableView.register(DiscoverCardTableCell.self, forCellReuseIdentifier: DiscoverCardTableCell.identifier)
        tableView.register(RateScreenCell.self, forCellReuseIdentifier: RateScreenCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.cellModelForRow(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath)
        
        cellType.configure(cell: cell)
        cellType.attachDelegates(to: cell, controller: self)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.cellModelForRow(at: indexPath.row).didSelect()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let inviteCell = cell as? InviteCardTableCell {
            inviteCell.startAutoScroll()
        }
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let inviteCell = cell as? InviteCardTableCell {
            inviteCell.stopAutoScroll()
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
    
    func didSelectDiscover(in cell: DiscoverCardTableCell, at indexPath: IndexPath) {
        print("Discover \(indexPath.item) da Collection tocado na célula \(tableView.indexPath(for: cell)?.row ?? 0)")
    }
}
