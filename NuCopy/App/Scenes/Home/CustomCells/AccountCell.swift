//
//  AccountCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 01/11/25.
//

import UIKit

class AccountCell: UITableViewCell {
    
    static let identifier: String = "AccountCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "Conta"
        return label
    }()
    
    lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
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
        label.text = "Uma conta completa, com função débito, sem tarifa de manutenção e que faz seu dinheiro render."
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Conhecer"
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
        addSubviews(HStack, descriptionLabel, buttonLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            HStack.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            HStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            HStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            descriptionLabel.topAnchor.constraint(equalTo: HStack.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: HStack.trailingAnchor),
            
            buttonLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            buttonLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            buttonLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        ])
    }
}
