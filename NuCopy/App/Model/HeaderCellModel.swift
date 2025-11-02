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
    func configure(_ cell: UITableViewCell)
}

struct HeaderCellModel: CellModelProtocol {
    
    let imageSystemName: String
    let onEyeTapped: (() -> Void)?
    let onHelpTapped: (() -> Void)?
    let onVerifyTapped: (() -> Void)?
    
    var cellIdentifier: String { HeaderCell.identifier }
    var cellHeight: CGFloat { 80 }
    
    func configure(_ cell: UITableViewCell) {
        guard let cell = cell as? HeaderCell else { return }
        cell.photoImageView.image = UIImage(systemName: imageSystemName)
        
        cell.eyeButton.addAction(UIAction { _ in onEyeTapped?() }, for: .touchUpInside)
        cell.helpButton.addAction(UIAction { _ in onHelpTapped?() } , for: .touchUpInside)
        cell.verifyButton.addAction(UIAction { _ in onVerifyTapped?() }, for: .touchUpInside)
    }
}
