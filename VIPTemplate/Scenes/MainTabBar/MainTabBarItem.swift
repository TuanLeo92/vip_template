//
//  MainTabBarItem.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import UIKit

enum TabBarItemType: Int {
    case favorites
    case regions
    case help
}

extension TabBarItemType {
    
    var image: UIImage? {
        switch self {
        case .favorites:
            return UIImage(named: "ic_look")
            
        case .regions:
            return UIImage(named: "ic_earth")
            
        case .help:
            return UIImage(named: "ic_help")
        }
    }
    
    var title: String? {
        switch self {
        case .favorites:
            return "tab.bar.favorites".localized
            
        case .regions:
            return "tab.bar.regions".localized
            
        case .help:
            return "tab.bar.help".localized
        }
    }
    
    var tabBarItem: UITabBarItem {
        let selectedItemAttributes = [NSAttributedString.Key.foregroundColor: AppColor.primaryBlue,
                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        let unselectedItemAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        
        let item = UITabBarItem(title: title, image: image, tag: rawValue)
        item.accessibilityValue = title
        item.setTitleTextAttributes(selectedItemAttributes, for: .selected)
        item.setTitleTextAttributes(unselectedItemAttributes, for: .normal)
        
        return item
    }
}
