//
//  ListFavoriteCountriesLogics.swift
//  VIPTemplate
//
//  Created by Le Tuan on 17/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Display logic
protocol ListFavoriteCountriesDisplayLogic: DisplayLogic {
    
    func displayListFavoriteCountries(viewModel: ListFavoriteCountries.FetchData.ViewModel)
    
}

// MARK: - Business logic
protocol ListFavoriteCountriesBusinessLogic: BusinessLogic {
    
    var presenter: ListFavoriteCountriesPresentationLogic! { set get }
    var worker: ListFavoriteCountriesWorker! { set get }
    
    var listCountries: [Country] { get }
    
    func performFetchDataOfFavoritesCountries(request: ListFavoriteCountries.FetchData.Request)
}

// MARK: - Presentation logic
protocol ListFavoriteCountriesPresentationLogic: PresentationLogic {
    
    var viewController: ListFavoriteCountriesDisplayLogic? { set get }
    
    func presentFetchedDataOfFavoritesCountries(response: ListFavoriteCountries.FetchData.Response)
}

// MARK: - Routing logic
protocol ListFavoriteCountriesRoutingLogic: RoutingLogic {
    
    var viewController: ListFavoriteCountriesViewController? { set get }
    
}
