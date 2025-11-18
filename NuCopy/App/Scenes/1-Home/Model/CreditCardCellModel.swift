//
//  CreditCardCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 08/11/25.
//

import UIKit

struct CreditCardCellModel {
    
    let titleLabel: String
    let chevronSystemName: String
    let currentInvoiceLabel: String
    let invoiceAmountLabel: String
    let availableLimitLabel: String
    
    var cellIdentifier: String { CreditCardCell.identifier }
    var cellHeight: CGFloat { 150 }
}
