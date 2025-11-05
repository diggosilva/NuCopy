//
//  ExtraMoneyCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 05/11/25.
//

import UIKit

struct ExtraMoneyCellModel: CellModelProtocol {
    
    let moneyImageSystemName: String
    let titleLabel: String
    let descriptionLabel: String
    let chevronSystemName: String
    
    var cellIdentifier: String { ExtraMoneyCell.identifier }
    var cellHeight: CGFloat { 60 }
    
    func configure(_ cell: UITableViewCell, delegate: (any CellCommonActionsDelegate)?) {
        guard let cell = cell as? ExtraMoneyCell else { return }
        cell.moneyImageView.image = UIImage(systemName: moneyImageSystemName)
        cell.titleLabel.text = titleLabel
        cell.descriptionLabel.text = descriptionLabel
        cell.chevronImageView.image = UIImage(systemName: chevronSystemName)
    }
}
