//
//  InviteCardCollectionCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 06/11/25.
//

import UIKit

final class InviteCardCollectionCell: UICollectionViewCell {
    
    static let identifier: String = "InviteCardCollectionCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .roxinho
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubviews(titleLabel, iconImageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            iconImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func configure(model: InviteItemModel) {
        titleLabel.attributedText = model.title.toAttributedString(
            baseFontSize: 15,
            baseFontWeight: .regular,
            boldFontWeight: .semibold
        )
        
        iconImageView.image = UIImage(systemName: model.iconSystemName)
    }
}
