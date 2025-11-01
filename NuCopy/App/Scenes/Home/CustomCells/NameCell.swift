//
//  NameCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

final class NameCell: UITableViewCell {
    
    static let identifier: String = "NameCell"
    
    lazy var grettingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.text = "Olá, John"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(grettingLabel)
        contentView.backgroundColor = .roxinho
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            grettingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            grettingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            grettingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
        ])
    }
}
