//
//  CategoriesAssembly.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class CategoriesAssembly {
    static func assemble() -> UIViewController {
        
        let view = CategoriesViewController()
        let manager = CategoriesTableViewManager()
        let presenter = CategoriesPresenter()
        let interactor = CategoriesInteractor()
        let router = CategoriesRouter()
        
        view.presenter = presenter
        
        manager.delegate = presenter
    
        presenter.interactor =  interactor
        presenter.router = router
        presenter.view = view
        presenter.tableViewManager = manager
        
        router.view = view
        
        return view
    }
}
