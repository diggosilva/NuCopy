//
//  HomeCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

enum HomeCell {
    case header
    case name
    
    var cellIdentifier: String {
        switch self {
        case .header: return HeaderCell.identifier
        case .name: return NameCell.identifier
        }
    }
}
