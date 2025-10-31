//
//  ViewController.swift
//  NuCopy
//
//  Created by Diggo Silva on 30/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderTopCell.identifier, for: indexPath) as? HeaderTopCell else { return UICollectionViewCell() }
            return cell
        }
        
        if indexPath.item == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderBottomCell.identifier, for: indexPath) as? HeaderBottomCell else { return UICollectionViewCell() }
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 50)
        }
        
        if indexPath.item == 1 {
            return CGSize(width: view.frame.width, height: 50)
        }
        
        return .zero
    }
}
