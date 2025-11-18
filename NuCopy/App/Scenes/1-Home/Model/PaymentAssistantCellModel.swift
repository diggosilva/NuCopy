//
//  PaymentAssistantCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 11/11/25.
//

import UIKit

struct PaymentAssistantCellModel {
    
    let titleLabel: String
    let chevronSystemName: String
    let descriptionLabel: String
    let buttonLabel: String
    
    var cellIdentifier: String { PaymentAssistantCell.identifier }
    var cellHeight: CGFloat { 100 }
}
