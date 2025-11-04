//
//  HeaderCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 31/10/25.
//

import UIKit

final class HeaderCell: UITableViewCell {
    
    static let identifier: String = "HeaderCell"
    
    weak var delegate: CellCommonActionsDelegate?
    
    lazy var photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: SFSymbols.profileImage)
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
        button.setImage(UIImage(systemName: SFSymbols.questionmarkCircle), for: .normal)
        return button
    }()
    
    lazy var verifyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: SFSymbols.checkmarkShield), for: .normal)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
        setupActions()
    }
    
    func setupActions() {
        eyeButton.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        helpButton.addTarget(self, action: #selector(helpTapped), for: .touchUpInside)
        verifyButton.addTarget(self, action: #selector(verifyTapped), for: .touchUpInside)
    }
    
    @objc private func eyeTapped() {
        delegate?.didTapEyeButton(in: self)
    }
    
    @objc private func helpTapped() {
        delegate?.didTapHelpButton(in: self)
    }
    
    @objc private func verifyTapped() {
        delegate?.didTapVerifyButton(in: self)
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
