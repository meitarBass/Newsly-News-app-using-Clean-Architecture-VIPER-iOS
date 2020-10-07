//
//  FavouritesPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

class FavouritesPresenter {
    
    weak var view: FavouritesViewInput?
    var interactor: FavouritesInteractorInput?
    var searchBarDelegate: FavouritesSearchBarManagerDelegate?
    var searchBarManager: FavouritesSearchBarManagerProtocol?
    var collectionManager: FavouritesCollectionViewManagerProtocol?
    var router: FavouritesRouter?
    
    var articles: [Article]?
}

extension FavouritesPresenter: FavouritesPresenterInput {
    func ApiFetchSuccess(articles: [Article]) {
        self.collectionManager?.setUpCells(articles: articles)
    }
    
    func handleError(error: Error) {
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: nil)
    }
}

extension FavouritesPresenter: FavouritesPresenterProtocol {
    func searchForArticles(by name: String) {
        guard let articles = articles else { return }
        let filteredArticles = interactor?.searchByName(by: name, articles: articles)
        // TODO: Set the collection View Manager
        interactor?.fetchFavouritesArticles()
    }
}

extension FavouritesPresenter: FavouritesCollectionViewManagerDelegate {
    
}

extension FavouritesPresenter: FavouritesSearchBarManagerDelegate {
    func searchBarClicked(name: String) {
        interactor?.fetchFavouritesArticles()
    }
}
