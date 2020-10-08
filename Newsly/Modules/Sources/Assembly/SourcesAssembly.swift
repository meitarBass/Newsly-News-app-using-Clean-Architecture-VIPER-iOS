//
//  SourcesAssembly.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

class SourcesAssembly {
    static func assemble() -> UIViewController {
        let view = SourcesViewController()
        let tableViewManager = SourcesTableViewManager()
        let presenter = SourcesPresenter()
        let interactor = SourcesInteractor()
        let router = SourcesRouter()
        
        view.presenter = presenter
        
        tableViewManager.delegate = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.tableViewManager = tableViewManager
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.apiManager = ServiceLocator.shared.getService()
        
        router.view = view
        
        return view
    }
}
