//
//  FeedCellType.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

enum HomeFeedItem {
    case headerTop
    case headerBottom
    
    var cellIdentifier: String {
        switch self {
        case .headerTop: return HeaderTopCell.identifier
        case .headerBottom: return HeaderBottomCell.identifier
        }
    }
}
