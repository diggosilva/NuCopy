//
//  AccountCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 02/11/25.
//

import UIKit

struct AccountCellModel: CellModelProtocol {
    
    let titleLabel: String
    let chevronImageView: UIImage?
    let descriptionLabel: String
    let buttonLabel: String
    
    var cellIdentifier: String { AccountCell.identifier }
    var cellHeight: CGFloat { 60 }
    
    func configure(_ cell: UITableViewCell) {
        guard let cell = cell as? AccountCell else { return }
        cell.titleLabel.text = titleLabel
        cell.chevronImageView.image = chevronImageView
        cell.descriptionLabel.text = descriptionLabel
        cell.buttonLabel.text = buttonLabel
    }
}
