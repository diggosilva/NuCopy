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

struct ShortcutCellModel {
    
    let shortcuts: [ShortcutItemModel]
    
    var cellIdentifier: String { ShortcutTableCell.identifier }
    var cellHeight: CGFloat { 100 }
}
