//
//  ShortcutTableCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 03/11/25.
//

import UIKit

final class ShortcutTableCell: UITableViewCell {
    
    static let identifier: String = "ShortcutTableCell"
    
    private var shortcuts: [ShortcutItemModel] = []
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 140)
        
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
        print("Shortcuts \(indexPath.item + 1) tapped")
    }
}
