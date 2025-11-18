//
//  RateScreenCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 13/11/25.
//

import UIKit

struct RateScreenCellModel {
    
    let heartIconSystemName: String
    let title: String
    
    var cellIdentifier: String { RateScreenCell.identifier }
    var cellHeight: CGFloat { 60 }
}
