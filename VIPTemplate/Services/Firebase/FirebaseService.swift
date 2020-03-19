//
//  FirebaseService.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import FirebaseFirestore

final class FirebaseService {
    
    static let shared = FirebaseService()
    
    let firestore = Firestore.firestore()
    
    struct Define {
        static let databaseRoot = "covid19"
        static let surveillance = "surveillance"
    }
    
}
