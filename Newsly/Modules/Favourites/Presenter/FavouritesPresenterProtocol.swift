//
//  FavouritesPresenterProtcol.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

// View to Presenter

import UIKit

protocol FavouritesPresenterProtocol: class {
    func searchForArticles(by name: String)
    
    var collectionManager: FavouritesCollectionViewManagerProtocol? { get set }
    var searchBarManager: FavouritesSearchBarManagerProtocol? { get set }
    func addPhotoTapped()
    
    func viewDidAppear() 
}

// Interactor to Presenter
protocol FavouritesPresenterInput: class {
    func ApiFetchSuccess(articles: [Article])
    func handleError(error: Error)
}

// SearchBar Manager to Presenter
protocol FavouritesSearchBarManagerDelegate: class {
    func searchBarClicked(name: String)
}

protocol FavouritesCollectionViewManagerDelegate: class {
    
}
