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
    
    var cellIdentifier: String {
        switch self {
        case .header: return HeaderCell.identifier
        case .name: return NameCell.identifier
        case .account: return AccountCell.identifier
        case .shortcuts: return ShortcutTableCell.identifier
        case .extraMoney: return ExtraMoneyCell.identifier
        case .invite: return InviteCardTableCell.identifier
        }
    }
}
