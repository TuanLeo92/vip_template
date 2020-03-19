//
//  BaseViewController.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    
    func logDeinit() {
        print("\(className) DEINIT!!!")
    }
    
    deinit {
        logDeinit()
    }
}

// MARK: - Load View From Storyboard
extension BaseViewController {
    
    static func loadFromStoryboard<Self: BaseViewController>() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as? Self else {
            return Self()
        }
        return viewController
    }
}
