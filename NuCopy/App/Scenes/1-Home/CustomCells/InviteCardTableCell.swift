//
//  InviteCardTableCell.swift
//  NuCopy
//
//  Created by Diggo Silva on 06/11/25.
//

import UIKit

final class InviteCardTableCell: UITableViewCell {
    
    static let identifier: String = "InviteCardTableCell"
    
    private var inviteItems: [InviteItemModel] = []
    
    weak var delegate: CellCommonActionsDelegate?
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(InviteCardCollectionCell.self, forCellWithReuseIdentifier: InviteCardCollectionCell.identifier)
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .label
        pageControl.pageIndicatorTintColor = .tertiaryLabel
        pageControl.isUserInteractionEnabled = false
        return pageControl
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
        selectionStyle = .none
        
        contentView.addSubview(cardView)
        cardView.addSubviews(collectionView, pageControl)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cardView.heightAnchor.constraint(equalToConstant: 100),
            
            collectionView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            pageControl.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with items: [InviteItemModel]) {
        self.inviteItems = items
        self.pageControl.numberOfPages = items.count
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
        collectionView.reloadData()
    }
}

extension InviteCardTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inviteItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InviteCardCollectionCell.identifier, for: indexPath) as? InviteCardCollectionCell else { return UICollectionViewCell() }
        let itemModel = inviteItems[indexPath.item]
        cell.configure(model: itemModel)
        return cell
    }
}

extension InviteCardTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectInvite(in: self, at: indexPath)
    }
}

extension InviteCardTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = pageIndex
    }
}
