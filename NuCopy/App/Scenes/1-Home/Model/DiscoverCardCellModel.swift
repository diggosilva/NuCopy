//
//  DiscoverCardCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 12/11/25.
//

import UIKit

struct DiscoverCardItemModel {
    
    let namedImage: String
    let title: String
    let description: String
    let titleButton: String
}

struct DiscoverCardCellModel {
    
    let titleLabel: String
    var items: [DiscoverCardItemModel]
    
    var cellIdentifier: String { DiscoverCardTableCell.identifier }
    var cellHeight: CGFloat { 400 }
}
