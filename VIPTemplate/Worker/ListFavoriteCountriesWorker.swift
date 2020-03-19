//
//  ListFavoriteCountriesWorker.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import RxSwift

class ListFavoriteCountriesWorker {
    
    func fetchListRegions(on date: String) -> Observable<[Region]> {
        return FirebaseService.shared.fetchListRegions(on: date)
    }
}
