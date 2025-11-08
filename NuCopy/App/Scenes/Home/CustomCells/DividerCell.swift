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
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(divider)
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            divider.heightAnchor.constraint(equalToConstant: 2)
        ])
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(model: DividerCellModel) { }
}
