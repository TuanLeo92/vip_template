//
//  ListFavoriteCountriesInteractor.swift
//  VIPTemplate
//
//  Created by Le Tuan on 17/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import RxSwift

class ListFavoriteCountriesInteractor: ListFavoriteCountriesBusinessLogic {
    
    var presenter: ListFavoriteCountriesPresentationLogic!
    var worker: ListFavoriteCountriesWorker!
    
    var listCountries: [Country] = []
    
    private var bag = DisposeBag()
    
    func performFetchDataOfFavoritesCountries(request: ListFavoriteCountries.FetchData.Request) {
        worker.fetchListRegions(on: request.date)
            .subscribe(onNext: { [weak self] regions in
                guard let this = self else { return }
                let favoriteCountries = this.findFavoriteCountries(from: regions)
                let response = ListFavoriteCountries.FetchData.Response(listCountries: favoriteCountries)
                self?.presenter.presentFetchedDataOfFavoritesCountries(response: response)
            }, onError: { error in
                
            })
            .disposed(by: bag)
    }
    
    private func findFavoriteCountries(from regions: [Region]) -> [Country] {
        let localFavoriteCountryCodes = LocalDataManager.shared.favoriteCountryCodes
        var favoriteCountries: [Country] = []
        regions.forEach { region in
            region.countries.forEach { country in
                //Mock
                favoriteCountries.append(country)
                //Real
//                if localFavoriteCountryCodes.contains(where: { localCode -> Bool in
//                    localCode == country.code
//                }) {
//                    favoriteCountries.append(country)
//                }
            }
        }
        
        return favoriteCountries
    }
}
