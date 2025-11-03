//
//  HeaderCellModel.swift
//  NuCopy
//
//  Created by Diggo Silva on 01/11/25.
//

import UIKit

protocol CellModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
    func configure(_ cell: UITableViewCell, delegate: CellCommonActionsDelegate?)
}

struct HeaderCellModel: CellModelProtocol {
    
    let imageSystemName: String
    
    var cellIdentifier: String { HeaderCell.identifier }
    var cellHeight: CGFloat { 80 }
    
    func configure(_ cell: UITableViewCell, delegate: CellCommonActionsDelegate?) {
        guard let cell = cell as? HeaderCell else { return }
        cell.photoImageView.image = UIImage(systemName: imageSystemName)
        cell.delegate = delegate
    }
}
