//
//  ExtraMoneyCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 05/11/25.
//

import UIKit

final class ExtraMoneyCell: UITableViewCell {
    
    static let identifier: String = "ExtraMoneyCell"
    
    lazy var extraMoneyBGImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    lazy var moneyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    lazy var VStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        selectionStyle = .none
        backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(extraMoneyBGImageView)
        extraMoneyBGImageView.addSubviews(moneyImageView, VStack, chevronImageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            extraMoneyBGImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            extraMoneyBGImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            extraMoneyBGImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            extraMoneyBGImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            extraMoneyBGImageView.heightAnchor.constraint(equalToConstant: 80),
            
            moneyImageView.centerYAnchor.constraint(equalTo: extraMoneyBGImageView.centerYAnchor),
            moneyImageView.leadingAnchor.constraint(equalTo: extraMoneyBGImageView.leadingAnchor, constant: 16),
            moneyImageView.widthAnchor.constraint(equalToConstant: 24),
            moneyImageView.heightAnchor.constraint(equalTo: moneyImageView.widthAnchor),
            
            VStack.topAnchor.constraint(equalTo: extraMoneyBGImageView.topAnchor, constant: 8),
            VStack.leadingAnchor.constraint(equalTo: moneyImageView.trailingAnchor, constant: 16),
            VStack.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -16),
            VStack.bottomAnchor.constraint(equalTo: extraMoneyBGImageView.bottomAnchor, constant: -8),
            
            chevronImageView.centerYAnchor.constraint(equalTo: extraMoneyBGImageView.centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: extraMoneyBGImageView.trailingAnchor, constant: -16),
            chevronImageView.widthAnchor.constraint(equalToConstant: 20),
            chevronImageView.heightAnchor.constraint(equalTo: chevronImageView.widthAnchor),
        ])
    }
    
    func configure(model: ExtraMoneyCellModel) {
        moneyImageView.image = UIImage(systemName: model.moneyImageSystemName)
        titleLabel.text = model.titleLabel
        descriptionLabel.text = model.descriptionLabel
    }
    
    // MARK: - Custom highlight behavior
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        UIView.animate(withDuration: 0.15) {
            self.extraMoneyBGImageView.backgroundColor = highlighted ? .systemGray3 : .systemGray5
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UIView.animate(withDuration: 0.15) {
            self.extraMoneyBGImageView.backgroundColor = selected ? .systemGray3 : .systemGray5
        }
    }
}
