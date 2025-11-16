//
//  PaymentAssistantCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 11/11/25.
//

import UIKit

final class PaymentAssistantCell: UITableViewCell {
    
    static let identifier: String = "PaymentAssistantCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var HStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, chevronImageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .white
        label.backgroundColor = .roxinho
        label.layer.cornerRadius = 18
        label.clipsToBounds = true
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
        contentView.addSubviews(HStack, descriptionLabel, buttonLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            HStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            HStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            HStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            descriptionLabel.topAnchor.constraint(equalTo: HStack.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: HStack.trailingAnchor),
            
            buttonLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            buttonLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            buttonLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    func configure(with model: PaymentAssistantCellModel) {
        titleLabel.text = model.titleLabel
        chevronImageView.image = UIImage(systemName: model.chevronSystemName)
        descriptionLabel.text = model.descriptionLabel
        buttonLabel.text = model.buttonLabel
    }
}
