//
//  LoanCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 10/11/25.
//

import UIKit

final class LoanCell: UITableViewCell {
    
    static let identifier: String = "LoanCell"
    
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
    
    lazy var loanTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var loanAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
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
        addSubviews(HStack, loanTitleLabel, loanAmountLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            HStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            HStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            HStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            loanTitleLabel.topAnchor.constraint(equalTo: HStack.bottomAnchor, constant: 16),
            loanTitleLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            loanTitleLabel.trailingAnchor.constraint(equalTo: HStack.trailingAnchor),
            
            loanAmountLabel.topAnchor.constraint(equalTo: loanTitleLabel.bottomAnchor, constant: 8),
            loanAmountLabel.leadingAnchor.constraint(equalTo: HStack.leadingAnchor),
            loanAmountLabel.trailingAnchor.constraint(equalTo: HStack.trailingAnchor),
            loanAmountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with model: LoanCellModel) {
        titleLabel.text = model.titleLabel
        chevronImageView.image = UIImage(systemName: model.chevronSystemName)
        loanTitleLabel.text = model.loanTitleLabel
        loanAmountLabel.text = model.loanAmountLabel
    }
}
