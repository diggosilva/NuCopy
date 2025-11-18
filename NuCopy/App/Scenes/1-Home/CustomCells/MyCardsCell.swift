//
//  MyCardsCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 09/11/25.
//

import UIKit

final class MyCardsCell: UITableViewCell {
    
    static let identifier = "MyCardsCell"
    
    lazy var myCardsBGImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    lazy var creditCardImageView: UIImageView = {
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
        contentView.addSubview(myCardsBGImageView)
        myCardsBGImageView.addSubviews(creditCardImageView, titleLabel)
        
        selectionStyle = .none
        backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myCardsBGImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            myCardsBGImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myCardsBGImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            myCardsBGImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0),
            myCardsBGImageView.heightAnchor.constraint(equalToConstant: 60),
            
            creditCardImageView.centerYAnchor.constraint(equalTo: myCardsBGImageView.centerYAnchor),
            creditCardImageView.leadingAnchor.constraint(equalTo: myCardsBGImageView.leadingAnchor, constant: 16),
            creditCardImageView.widthAnchor.constraint(equalToConstant: 24),
            creditCardImageView.heightAnchor.constraint(equalTo: creditCardImageView.widthAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: creditCardImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: creditCardImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: myCardsBGImageView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(model: MyCardsCellModel) {
        creditCardImageView.image = UIImage(systemName: model.iconSystemName)
        titleLabel.text = model.title
        
        if creditCardImageView.image == UIImage(systemName: SFSymbols.creditcard) {
            creditCardImageView.transform = CGAffineTransform(rotationAngle: .pi / 2)
        } else {
            creditCardImageView.transform = .identity
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        UIView.animate(withDuration: 0.15) {
            self.myCardsBGImageView.backgroundColor = highlighted ? .systemGray3 : .systemGray5
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UIView.animate(withDuration: 0.15) {
            self.myCardsBGImageView.backgroundColor = selected ? .systemGray3: .systemGray5
        }
    }
}
