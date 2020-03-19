//
//  Region.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import FirebaseFirestore
import ObjectMapper

struct Region {
    
    var name: String
    var countries: [Country]
    
}

extension Region {
    
    init() {
        self.name = ""
        self.countries = []
    }
    
    init(document: QueryDocumentSnapshot) {
        self.init()
        
        self.name = document.get("name") as? String ?? ""
        if let countries = document.get("countries") as? [[String : Any]] {
            self.countries = countries.map({ countryJSON -> Country in
                return (Country(JSON: countryJSON) ?? Country())
            })
        }
    }
}
