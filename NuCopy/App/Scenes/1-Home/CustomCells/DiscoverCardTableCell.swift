//
//  DiscoverCardTableCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 12/11/25.
//

import UIKit

final class DiscoverCardTableCell: UITableViewCell {
    
    static let identifier: String = "DiscoverCardTableCell"
    
    var discoverItems: [DiscoverCardItemModel] = []
    
    weak var delegate: CellCommonActionsDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        layout.itemSize = CGSize(width: 240, height: 280)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DiscoverCardCollectionCell.self, forCellWithReuseIdentifier: DiscoverCardCollectionCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
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
        contentView.addSubviews(titleLabel, collectionView)
        self.selectionStyle = .none
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configure(with model: DiscoverCardCellModel) {
        titleLabel.text = model.titleLabel
        self.discoverItems = model.items
        collectionView.reloadData()
    }
}

extension DiscoverCardTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discoverItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCardCollectionCell.identifier, for: indexPath) as? DiscoverCardCollectionCell else { return UICollectionViewCell() }
        let item = discoverItems[indexPath.item]
        cell.configure(with: item)
        return cell
    }
}

extension DiscoverCardTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectDiscover(in: self, at: indexPath)
    }
}
