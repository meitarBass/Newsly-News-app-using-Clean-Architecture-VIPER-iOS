//
//  CategoriesRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

protocol CategoriesRouterProtocol {
    var view: UIViewController? { get set }
    func createDiscoverCategory(categoryName: String)
}

class CategoriesRouter: CategoriesRouterProtocol {
    weak var view: UIViewController?
    
    func createDiscoverCategory(categoryName: String) {
        let discoverView = DiscoverAssembly.assemble(endpoint: .getArticlesFromCategory(categoryName.lowercased()))
        discoverView.title = categoryName
        view?.navigationController?.pushViewController(discoverView, animated: true)
    }
}
