//
//  SearchPresenterProtocols.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import Foundation

// View to Presenter
protocol SearchPresenterProtocol: class {
    func searchForArticles(by name: String)
    var collectionManager: SearchCollectionViewManagerProtocol? { get set }
    var searchBarManager: SearchSearchBarManagerProtocol? { get set }
}

// Interactor to Presenter
protocol SearchPresenterInput: class {
    func apiFetchSuccess(articles: [Article])
    func handleError(error: Error)
}

protocol SearchCollectionViewManagerDelegate: class {
    
}

protocol SearchBarManagerDelegate: class {
    func searchClicked(name: String)
}
