//
//  Country.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import ObjectMapper

struct Country {
    
    var name: String
    var code: String
    var totalConfirmedCases: Int
    var totalConfirmedNewCases: Int
    var totalDeaths: Int
    var totalNewDeaths: Int
    
}

extension Country {
    
    init() {
        self.name = ""
        self.code = ""
        self.totalConfirmedCases = 0
        self.totalConfirmedNewCases = 0
        self.totalDeaths = 0
        self.totalNewDeaths = 0
    }
}

extension Country: Mappable {
    
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        code <- map["code"]
        totalConfirmedCases <- map["total_confirmed_cases"]
        totalConfirmedNewCases <- map["total_confirmed_new_cases"]
        totalDeaths <- map["total_deaths"]
        totalNewDeaths <- map["total_new_deaths"]
    }
}
