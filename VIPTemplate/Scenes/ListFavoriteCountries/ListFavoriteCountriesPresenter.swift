//
//  ListFavoriteCountriesPresenter.swift
//  VIPTemplate
//
//  Created by Le Tuan on 17/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation

class ListFavoriteCountriesPresenter: ListFavoriteCountriesPresentationLogic {
    
    weak var viewController: ListFavoriteCountriesDisplayLogic?
    
    func presentFetchedDataOfFavoritesCountries(response: ListFavoriteCountries.FetchData.Response) {
        let viewModel = ListFavoriteCountries.FetchData.ViewModel(listCountries: response.listCountries)
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.displayListFavoriteCountries(viewModel: viewModel)
        }
    }
}
