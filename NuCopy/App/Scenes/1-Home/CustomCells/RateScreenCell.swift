//
//  RateScreenCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 13/11/25.
//

import UIKit

final class RateScreenCell: UITableViewCell {
    
    static var identifier: String = "RateScreenCell"
    
    private lazy var heartIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .roxinho
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .roxinho
        return label
    }()
    
    lazy var HStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartIconImageView, titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
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
        contentView.addSubviews(HStack)
        self.selectionStyle = .none
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            heartIconImageView.widthAnchor.constraint(equalToConstant: 24),
            heartIconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            HStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            HStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            HStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    func configure(model: RateScreenCellModel) {
        heartIconImageView.image = UIImage(systemName: SFSymbols.heart)
        titleLabel.text = model.title
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        UIView.animate(withDuration: 0.2) {
            let alpha: CGFloat = highlighted ? 0.5 : 1.0
            self.titleLabel.alpha = alpha
            self.heartIconImageView.alpha = alpha
        }
    }
}
