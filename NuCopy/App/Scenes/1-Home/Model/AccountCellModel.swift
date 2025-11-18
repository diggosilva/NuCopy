//
//  AccountCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 02/11/25.
//

import UIKit

struct AccountCellModel {
    
    let titleLabel: String
    let chevronSystemName: String
    let descriptionLabel: String
    let buttonLabel: String
    
    var cellIdentifier: String { AccountCell.identifier }
    var cellHeight: CGFloat { 60 }
}
