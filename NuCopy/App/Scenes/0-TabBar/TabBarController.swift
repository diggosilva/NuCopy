//
//  TabBarController.swift
//  NuCopy
//
//  Created by Diggo Silva on 14/11/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeTC = HomeViewTableController()
    let moneyVC = MoneyViewController()
    let mobileVC = MobileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        homeTC.tabBarItem.image = UIImage(systemName: SFSymbols.house)?.withTintColor(UIColor.roxinho, renderingMode: .alwaysOriginal)
        homeTC.tabBarItem.selectedImage = UIImage(systemName: SFSymbols.houseFill)?.withTintColor(UIColor.roxinho, renderingMode: .alwaysOriginal)
        
        moneyVC.tabBarItem.image = UIImage(systemName: SFSymbols.dollarSign)?.withTintColor(UIColor.roxinho, renderingMode: .alwaysOriginal)
        moneyVC.tabBarItem.selectedImage = UIImage(systemName: SFSymbols.dollarSignFill)?.withTintColor(UIColor.roxinho, renderingMode: .alwaysOriginal)
        
        mobileVC.tabBarItem.image = UIImage(systemName: SFSymbols.smartphone)?.withTintColor(UIColor.roxinho, renderingMode: .alwaysOriginal)
        mobileVC.tabBarItem.selectedImage = UIImage(systemName: SFSymbols.smartphone)?.withTintColor(UIColor.roxinho, renderingMode: .alwaysOriginal)
        
        viewControllers = [homeTC, moneyVC, mobileVC]
        self.tabBar.backgroundColor = .white
    }
}
