//
//  NameCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 01/11/25.
//

import UIKit

struct NameCellModel: CellModelProtocol {

    let username: String
    var cellIdentifier: String { NameCell.identifier }
    var cellHeight: CGFloat { 60 }
    
    func configure(_ cell: UITableViewCell, delegate: CellCommonActionsDelegate?) {
        guard let cell = cell as? NameCell else { return }
        cell.grettingLabel.text = "Olá, \(username)"
    }
}
