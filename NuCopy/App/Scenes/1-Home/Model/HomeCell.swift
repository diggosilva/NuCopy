//
//  HomeCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

enum HomeCell {
    case header(HeaderCellModel)
    case name(NameCellModel)
    case account(AccountCellModel)
    case shortcuts(ShortcutCellModel)
    case extraMoney(ExtraMoneyCellModel)
    case invite(InviteCardCellModel)
    case divider(DividerCellModel)
    case creditCard(CreditCardCellModel)
    case myCards(MyCardsCellModel)
    case loan(LoanCellModel)
    case paymentAssistent(PaymentAssistantCellModel)
    case discover(DiscoverCardCellModel)
    case rateScreen(RateScreenCellModel)
    
    var cellIdentifier: String {
        switch self {
        case .header: return HeaderCell.identifier
        case .name: return NameCell.identifier
        case .account: return AccountCell.identifier
        case .shortcuts: return ShortcutTableCell.identifier
        case .extraMoney: return ExtraMoneyCell.identifier
        case .invite: return InviteCardTableCell.identifier
        case .divider: return DividerCell.identifier
        case .creditCard: return CreditCardCell.identifier
        case .myCards: return MyCardsCell.identifier
        case .loan: return LoanCell.identifier
        case .paymentAssistent: return PaymentAssistantCell.identifier
        case .discover: return DiscoverCardTableCell.identifier
        case .rateScreen: return RateScreenCell.identifier
        }
    }
}

extension HomeCell {
    func configure(cell: UITableViewCell) {
        switch self {
        case .header(let model):
            (cell as? HeaderCell)?.configure(model: model)
            
        case .name(let model):
            (cell as? NameCell)?.configure(model: model)
            
        case .account(let model):
            (cell as? AccountCell)?.configure(model: model)
            
        case .shortcuts(let model):
            (cell as? ShortcutTableCell)?.configure(shortcuts: model.shortcuts)
            
        case .extraMoney(let model):
            (cell as? ExtraMoneyCell)?.configure(model: model)
            
        case .invite(let model):
            (cell as? InviteCardTableCell)?.configure(items: model.inviteItems)
            
        case .divider(let model):
            (cell as? DividerCell)?.configure(model: model)
            
        case .creditCard(let model):
            (cell as? CreditCardCell)?.configure(model: model)
            
        case .myCards(let model):
            (cell as? MyCardsCell)?.configure(model: model)
            
        case .loan(let model):
            (cell as? LoanCell)?.configure(model: model)
            
        case .paymentAssistent(let model):
            (cell as? PaymentAssistantCell)?.configure(model: model)
            
        case .discover(let model):
            (cell as? DiscoverCardTableCell)?.configure(model: model)
            
        case .rateScreen(let model):
            (cell as? RateScreenCell)?.configure(model: model)
        }
    }
}

extension HomeCell {
    func attachDelegates(to cell: UITableViewCell, controller: HomeViewTableController) {
        switch self {
        case .header: (cell as? HeaderCell)?.delegate = controller
        case .shortcuts: (cell as? ShortcutTableCell)?.delegate = controller
        case .invite: (cell as? InviteCardTableCell)?.delegate = controller
        case .discover: (cell as? DiscoverCardTableCell)?.delegate = controller
        default: break
        }
    }
}

extension HomeCell {
    func didSelect() {
        switch self {
        case .header: print("Header tapped")
        case .name: print("Name tapped")
        case .account: print("Account tapped")
        case .shortcuts: print("Shortcuts tapped")
        case .extraMoney: print("Extra Money tapped")
        case .invite: print("Invite tapped")
        case .divider: print("Divider tapped")
        case .creditCard: print("Credit Card tapped")
        case .myCards: print("My Cards tapped")
        case .loan: print("Loan tapped")
        case .paymentAssistent: print("Payment Assistent tapped")
        case .discover: print("Discover tapped")
        case .rateScreen: print("Rate Screen tapped")
        }
    }
}
