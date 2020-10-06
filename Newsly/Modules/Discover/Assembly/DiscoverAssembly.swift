//
//  DiscoverAssembly.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit


class DiscoverAssembly {
    static func assemble() -> UIViewController {
        let view = DiscoverViewController()
        let collectionManager = DiscoverCollectionViewManager()
        let presenter = DiscoverPresenter()
        let interactor = DiscoverInteractor()
        let router = DiscoverRouter()
        
        view.presenter = presenter
        
        collectionManager.delegate = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.collectionManager = collectionManager
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.apiManager = NetworkService<ArticleEndpoint>()
        
        // MARK: - What this line does
        router.view = view
        
        return view
    }
}
