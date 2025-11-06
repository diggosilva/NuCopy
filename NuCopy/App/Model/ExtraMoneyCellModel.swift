//
//  ExtraMoneyCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 05/11/25.
//

import UIKit

struct ExtraMoneyCellModel {
    
    let moneyImageSystemName: String
    let titleLabel: String
    let descriptionLabel: String
    let chevronSystemName: String
    
    var cellIdentifier: String { ExtraMoneyCell.identifier }
    var cellHeight: CGFloat { 60 }
}
