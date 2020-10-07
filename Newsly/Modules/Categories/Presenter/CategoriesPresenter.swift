//
//  CategoriesPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

class CategoriesPresenter {
    
    weak var view: CategoriesViewInput?
    var tableViewManager: CategoriesTableViewManagerProtocol?
    var interactor: CategoriesInteractorInput?
    var router: CategoriesRouterProtocol?
}

extension CategoriesPresenter: CategoriesPresenterProtocol {

}

extension CategoriesPresenter: CategoriesTableViewManagerDelegate {
    func sourceSelected(at row: Int) {
        print(Categories.categories[row])
        let category: String = Categories.categories[row].rawValue
        let chosenCategory = category.replacingOccurrences(of: " ", with: "-")
        self.router?.createDiscoverCategory(categoryName: chosenCategory)
    }
}


extension CategoriesPresenter: CategoriesPresenterInput {
    
}
