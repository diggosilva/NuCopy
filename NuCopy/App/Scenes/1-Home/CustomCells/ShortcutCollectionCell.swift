//
//  ShortcutCollectionCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 03/11/25.
//

import UIKit

final class ShortcutCollectionCell: UICollectionViewCell {
    
    static let identifier: String = "ShortcutCollectionCell"
    
    lazy var shortcutBGImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    lazy var shortcutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var shortcutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var loanAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .monospacedDigitSystemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .roxinho
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        label.isHidden = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
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
        contentView.addSubviews(shortcutBGImageView, shortcutLabel)
        shortcutBGImageView.addSubview(shortcutImageView)
        contentView.addSubview(loanAmountLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // Círculo (fundo do ícone)
            shortcutBGImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shortcutBGImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shortcutBGImageView.widthAnchor.constraint(equalToConstant: 80),
            shortcutBGImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // Ícone dentro do círculo
            shortcutImageView.centerXAnchor.constraint(equalTo: shortcutBGImageView.centerXAnchor),
            shortcutImageView.centerYAnchor.constraint(equalTo: shortcutBGImageView.centerYAnchor),
            shortcutImageView.widthAnchor.constraint(equalToConstant: 24),
            shortcutImageView.heightAnchor.constraint(equalTo: shortcutImageView.widthAnchor),
            
            // Label valor dísponível pra empréstimo “R$10.000”
            loanAmountLabel.leadingAnchor.constraint(equalTo: shortcutBGImageView.leadingAnchor),
            loanAmountLabel.trailingAnchor.constraint(equalTo: shortcutBGImageView.trailingAnchor),
            loanAmountLabel.bottomAnchor.constraint(equalTo: shortcutBGImageView.bottomAnchor, constant: 8),
            loanAmountLabel.heightAnchor.constraint(equalToConstant: 16),
            
            // Label inferior
            shortcutLabel.topAnchor.constraint(equalTo: shortcutBGImageView.bottomAnchor, constant: 16),
            shortcutLabel.leadingAnchor.constraint(equalTo: shortcutBGImageView.leadingAnchor),
            shortcutLabel.trailingAnchor.constraint(equalTo: shortcutBGImageView.trailingAnchor),
            shortcutLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(model: ShortcutItemModel) {
        shortcutLabel.text = model.title
        shortcutImageView.image = UIImage(systemName: model.imageName)
        
        if shortcutImageView.image == UIImage(systemName: SFSymbols.squareGrid2x2) {
            shortcutImageView.transform = CGAffineTransform(rotationAngle: .pi / 4)
        } else {
            shortcutImageView.transform = .identity
        }
        
        if shortcutImageView.image == UIImage(systemName: SFSymbols.dollarSign) {
            loanAmountLabel.isHidden = false
            if model.loanValue != nil {
                loanAmountLabel.text = model.loanValue
            } else {
                loanAmountLabel.text = "•••"
            }
        } else {
            loanAmountLabel.isHidden = true
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.shortcutBGImageView.backgroundColor = self.isHighlighted ? UIColor.systemGray3 : .systemGray5
            }
        }
    }
}
