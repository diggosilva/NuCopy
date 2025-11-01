//
//  HeaderCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

final class HeaderCell: UICollectionViewCell {
    
    static let identifier: String = "HeaderCell"
    
    lazy var photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "person.crop.circle")
        iv.clipsToBounds = true
        iv.tintColor = .white
        return iv
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        return button
    }()
    
    lazy var helpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        return button
    }()
    
    lazy var verifyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark.shield"), for: .normal)
        return button
    }()
    
    lazy var HStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [eyeButton, helpButton, verifyButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 16
        sv.tintColor = .white
        return sv
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
        contentView.addSubview(photoImageView)
        contentView.addSubview(HStack)
        contentView.backgroundColor = .roxinho
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            photoImageView.widthAnchor.constraint(equalToConstant: 50),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            HStack.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            HStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            HStack.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
