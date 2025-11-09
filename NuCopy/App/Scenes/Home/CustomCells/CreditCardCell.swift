//
//  CreditCardCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 08/11/25.
//

import UIKit

final class CreditCardCell: UITableViewCell {
    
    static let identifier: String = "CreditCardCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
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
    
    lazy var currentInvoiceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var invoiceAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var availableLimitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
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
        addSubviews(HStack, currentInvoiceLabel, invoiceAmountLabel, availableLimitLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            HStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            HStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            HStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            currentInvoiceLabel.topAnchor.constraint(equalTo: HStack.bottomAnchor, constant: 16),
            currentInvoiceLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            currentInvoiceLabel.trailingAnchor.constraint(equalTo: HStack.trailingAnchor),
            
            invoiceAmountLabel.topAnchor.constraint(equalTo: currentInvoiceLabel.bottomAnchor, constant: 8),
            invoiceAmountLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            invoiceAmountLabel.trailingAnchor.constraint(equalTo: HStack.trailingAnchor),
            
            availableLimitLabel.topAnchor.constraint(equalTo: invoiceAmountLabel.bottomAnchor, constant: 16),
            availableLimitLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            availableLimitLabel.trailingAnchor.constraint(equalTo: HStack.trailingAnchor),
            availableLimitLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    func configure(with model: CreditCardCellModel) {
        titleLabel.text = model.titleLabel
        chevronImageView.image = UIImage(systemName: model.chevronSystemName)
        currentInvoiceLabel.text = model.currentInvoiceLabel
        invoiceAmountLabel.text = model.invoiceAmountLabel
        availableLimitLabel.text = model.availableLimitLabel
    }
}
