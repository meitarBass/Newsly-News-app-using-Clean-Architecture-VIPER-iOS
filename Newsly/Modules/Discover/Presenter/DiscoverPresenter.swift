//
//  DiscoverPresenter.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import Foundation


class DiscoverPresenter {
    
    weak var view: DiscoverViewInput?
    var interactor: DiscoverInteractorInput?
    var router: DiscoverRouterProtocol?
    var collectionManager: DiscoverCollectionViewManagerProtocol?
    
}

//MARK: - DiscoverPresenterProtocol
extension DiscoverPresenter: DiscoverPresenterProtocol {
    func viewDidLoad() {
        
    }
    
}

//MARK: - DiscoverPresenterInput
extension DiscoverPresenter: DiscoverPresenterInput {
    
}


//MARK: - DiscoverCollectionViewManagerDelegate
extension DiscoverPresenter: DiscoverCollectionViewManagerDelegate {
    
}
