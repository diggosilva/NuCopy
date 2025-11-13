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
        }
    }
}
