//
//  ShortcutTableCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 03/11/25.
//

import UIKit

final class ShortcutTableCell: UITableViewCell {
    
    static let identifier: String = "ShortcutTableCell"
    
    weak var delegate: CellCommonActionsDelegate?
    
    private var shortcuts: [ShortcutItemModel] = []
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ShortcutCollectionCell.self, forCellWithReuseIdentifier: ShortcutCollectionCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(collectionView)
        self.selectionStyle = .none
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configure(with shortcuts: [ShortcutItemModel]) {
        self.shortcuts = shortcuts
        collectionView.isScrollEnabled = shortcuts.count > 4
        collectionView.reloadData()
    }
}

extension ShortcutTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shortcuts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortcutCollectionCell.identifier, for: indexPath) as? ShortcutCollectionCell else { return UICollectionViewCell() }
        let shortcut = shortcuts[indexPath.item]
        cell.configure(with: shortcut)
        return cell
    }
}

extension ShortcutTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectShortcut(in: self, at: indexPath)
    }
}

extension ShortcutTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Largura total da collection view
        let totalWidth = collectionView.bounds.width
        
        // Quantas células você quer mostrar por linha (4, por exemplo)
        let numberOfItems: CGFloat = min(CGFloat(shortcuts.count), 4)
        
        // Espaçamento entre células
        let spacing: CGFloat = 0
        
        // Calcula largura da célula para caber na tela
        let width = (totalWidth - (numberOfItems - 1) * spacing) / numberOfItems
        let height: CGFloat = 140
        
        return CGSize(width: width, height: height)
    }
}
