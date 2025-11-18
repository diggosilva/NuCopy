//
//  LoanCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 10/11/25.
//

import UIKit

struct LoanCellModel {
    
    let titleLabel: String
    let chevronSystemName: String
    let loanTitleLabel: String
    let loanAmountLabel: String
    
    var cellIdentifier: String { LoanCell.identifier }
    var cellHeight: CGFloat { 100 }
}
