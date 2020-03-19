//
//  AppDelegate.swift
//  VIPTemplate
//
//  Created by Le Tuan on 9/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarController.instance()
        window?.makeKeyAndVisible()
        
        configThirdParties()
        
        return true
    }
    
    private func configThirdParties() {
        FirebaseApp.configure()
    }
}

