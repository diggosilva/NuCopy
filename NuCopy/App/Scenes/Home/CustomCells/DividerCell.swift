//
//  DividerCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 07/11/25.
//

import UIKit

final class DividerCell: UITableViewCell {
    
    static let identifier = "DividerCell"
    
    private let divider: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .systemGray5
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(divider)
        NSLayoutConstraint.activate([
            divider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 2)
        ])
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(model: DividerCellModel) { }
}
