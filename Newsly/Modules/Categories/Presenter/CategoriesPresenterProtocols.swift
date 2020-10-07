//
//  CategoriesPresenterProtocols.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

// View To Presenter
protocol CategoriesPresenterProtocol: class {
    var tableViewManager: CategoriesTableViewManagerProtocol? { get set }
}

// Interactor To Presenter
protocol CategoriesPresenterInput: class {
}

// 
protocol CategoriesTableViewManagerDelegate: class {
    func sourceSelected(at row: Int)
}
