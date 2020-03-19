//
//  MainTabBarController.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    class func instance() -> MainTabBarController {
        
        let favoriteCountriesVC = ListFavoriteCountriesViewController.loadFromStoryboard()
        favoriteCountriesVC.tabBarItem = TabBarItemType.favorites.tabBarItem
        let favoriteCountriesNavi = UINavigationController(rootViewController: favoriteCountriesVC)

        let regionsVC = ListRegionsViewController.loadFromStoryboard()
        regionsVC.tabBarItem = TabBarItemType.regions.tabBarItem
        let regionsNavi = UINavigationController(rootViewController: regionsVC)
        
        let helpVC = HelpViewController.loadFromStoryboard()
        helpVC.tabBarItem = TabBarItemType.help.tabBarItem
        let helpNavi = UINavigationController(rootViewController: helpVC)
        
        let tabBarController = MainTabBarController()
        tabBarController.viewControllers = [favoriteCountriesNavi, regionsNavi, helpNavi]
        
        return tabBarController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = AppColor.primaryBlue
    }
}
