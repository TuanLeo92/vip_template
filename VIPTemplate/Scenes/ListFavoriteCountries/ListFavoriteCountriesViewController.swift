//
//  ListFavoriteCountriesViewController.swift
//  VIPTemplate
//
//  Created by Le Tuan on 17/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import UIKit

class ListFavoriteCountriesViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var interactor: ListFavoriteCountriesInteractor!
    var router: ListFavoriteCountriesRouter!
    
    private var listCountries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLogics()
        configCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        interactor.performFetchDataOfFavoritesCountries(request: ListFavoriteCountries.FetchData.Request(date: "2020-03-17"))
    }
    
    private func createLogics() {
        interactor = ListFavoriteCountriesInteractor()
        interactor.worker = ListFavoriteCountriesWorker()
        interactor.presenter = ListFavoriteCountriesPresenter()
        interactor.presenter.viewController = self
        router = ListFavoriteCountriesRouter()
        router.viewController = self
    }
}

extension ListFavoriteCountriesViewController {
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(cellName: FavoriteCountryCell.className)
        collectionView.isPagingEnabled = true
        self.automaticallyAdjustsScrollViewInsets = false
    }
}

extension ListFavoriteCountriesViewController: ListFavoriteCountriesDisplayLogic {
    
    func displayListFavoriteCountries(viewModel: ListFavoriteCountries.FetchData.ViewModel) {
        self.listCountries = viewModel.listCountries
        view.layoutIfNeeded()
        collectionView.reloadData()
    }
}

extension ListFavoriteCountriesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension ListFavoriteCountriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCountries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: FavoriteCountryCell.self, for: indexPath)
        if 0..<listCountries.count ~= indexPath.item {
            cell.country = listCountries[indexPath.item]
        }
        return cell
    }
}
