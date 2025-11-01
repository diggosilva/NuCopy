//
//  ViewController.swift
//  NuCopy
//
//  Created by Diggo Silva on 30/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let cellItems: [HomeCell] = [.header, .name]
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .roxinho
        configureDataSourcesAndDelegates()
    }
    
    private func configureDataSourcesAndDelegates() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = cellItems[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.cellIdentifier, for: indexPath)
        
        switch cellType {
        case .header:
            guard let headerTopCell = cell as? HeaderCell else { return UICollectionViewCell() }
            return headerTopCell
            
        case .name:
            guard let headerBottomCell = cell as? NameCell else { return UICollectionViewCell() }
            return headerBottomCell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellType = cellItems[indexPath.item]
        let width = collectionView.frame.width
        
        switch cellType {
        case .header:
            return CGSize(width: width, height: 50)
            
        case .name:
            return CGSize(width: width, height: 50)
        }
    }
}
