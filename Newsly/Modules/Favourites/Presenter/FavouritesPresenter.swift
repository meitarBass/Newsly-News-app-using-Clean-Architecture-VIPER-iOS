//
//  FavouritesPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class FavouritesPresenter {
    
    weak var view: FavouritesViewInput?
    var interactor: FavouritesInteractorInput?
    var searchBarDelegate: FavouritesSearchBarManagerDelegate?
    var searchBarManager: FavouritesSearchBarManagerProtocol?
    var collectionManager: FavouritesCollectionViewManagerProtocol?
    
    var router: FavouritesRouter?
//    var articles: [Article]?
}

extension FavouritesPresenter: FavouritesPresenterInput {
    func ApiFetchSuccess(articles: [Article]) {
        view?.hideActivityIndicator()
        self.collectionManager?.setUpCells(articles: articles)
    }
    
    func handleError(error: Error) {
        view?.hideActivityIndicator()
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
    }
}

extension FavouritesPresenter: FavouritesPresenterProtocol {
    func searchForArticles(by name: String) {
        // TODO: Set the collection View Manager
        view?.showActivityIndicator()
        interactor?.fetchFavouritesArticles()
    }
    
    func loadFavouriteArticles() -> [Article]? {
        return interactor?.loadFavouriteArticles()
    }
    
    func loadProfileImage() -> UIImage? {
        return interactor?.loadProfileImage()
    }
}

extension FavouritesPresenter: FavouritesCollectionViewManagerDelegate {
    
}

extension FavouritesPresenter: FavouritesSearchBarManagerDelegate {
    func searchBarClicked(name: String) {
        interactor?.fetchFavouritesArticles()
    }
}
