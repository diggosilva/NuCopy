//
//  MyCardsCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 09/11/25.
//

import UIKit

struct MyCardsCellModel {
    
    let iconSystemName: String
    let title: String
    
    var cellIdentifier: String { MyCardsCell.identifier }
    var cellHeight: CGFloat { 60 }
}
