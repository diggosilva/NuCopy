//
//  InviteCardCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 06/11/25.
//

import Foundation

struct InviteItemModel {
    let title: String
    let iconSystemName: String
}

struct InviteCardCellModel {
    
    var inviteItems: [InviteItemModel]
    
    var cellIdentifier: String { InviteCardTableCell.identifier }
    var celHeight: CGFloat { 150 }
}
