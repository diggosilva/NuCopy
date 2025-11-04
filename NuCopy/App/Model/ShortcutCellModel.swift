//
//  ShortcutCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 03/11/25.
//

import UIKit

struct ShortcutItemModel {
    let imageName: String
    let title: String
    let loanValue: String?
}

struct ShortcutCellModel: CellModelProtocol {
    
    let shortcuts: [ShortcutItemModel]
    
    var cellIdentifier: String { ShortcutTableCell.identifier }
    var cellHeight: CGFloat { 100 }
    
    func configure(_ cell: UITableViewCell, delegate: (any CellCommonActionsDelegate)?) {
        guard let cell = cell as? ShortcutTableCell else { return }
        cell.configure(with: shortcuts)
    }
}
