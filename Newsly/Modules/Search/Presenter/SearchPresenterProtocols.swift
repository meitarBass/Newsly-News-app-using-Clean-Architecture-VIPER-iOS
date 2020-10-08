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
    var searchControllerManager: searchControllerManagerProtocol? { get set }
}

// Interactor to Presenter
protocol SearchPresenterInput: class {
    func apiFetchSuccess(articles: [Article])
    func handleError(error: Error)
}

// Manager to Presenter
protocol SearchCollectionViewManagerDelegate: class {
    func cellClicked(urlString: String?, sourceName: String?)
}

// Manager to Presenter
protocol SearchBarManagerDelegate: class {
    func searchClicked(name: String)
}
