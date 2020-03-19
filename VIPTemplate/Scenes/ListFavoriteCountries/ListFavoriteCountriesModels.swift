//
//  ListFavoriteCountriesModels.swift
//  VIPTemplate
//
//  Created by Le Tuan on 17/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation

enum ListFavoriteCountries {
    
    enum FetchData {
        struct Request {
            var date: String // Format: yyyy-MM-dd
        }
        struct Response {
            var listCountries: [Country]
        }
        struct ViewModel {
            var listCountries: [Country]
        }
    }
}
