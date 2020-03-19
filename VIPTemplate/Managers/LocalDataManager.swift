//
//  LocalDataManager.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation

final class LocalDataManager {
    
    static let shared = LocalDataManager()
    
    struct Key {
        static let favoriteCountryCodes = "Favorite Country Codes Key"
    }
}

extension LocalDataManager {
    
    var favoriteCountryCodes: [String] {
        set {
            UserDefaults.standard.set(newValue, forKey: Key.favoriteCountryCodes)
            UserDefaults.standard.synchronize()
        }
        get {
            UserDefaults.standard.value(forKey: Key.favoriteCountryCodes) as? [String] ?? []
        }
    }
}
