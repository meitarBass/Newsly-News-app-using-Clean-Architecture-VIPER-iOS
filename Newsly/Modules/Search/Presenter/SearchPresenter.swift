//
//  SearchPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import Foundation


class SearchPresenter {
    
    weak var view: SearchViewInput?
    var interactor: SearchInteractorInput?
    var router: SearchRouter?
    var collectionManager: SearchCollectionViewManagerProtocol?
//
    var searchBarManager: SearchSearchBarManagerProtocol?
//
    var searchBarDelegate: SearchBarManagerDelegate?
}
//
extension SearchPresenter: SearchPresenterProtocol {    
    func searchForArticles(by name: String) {
        interactor?.fetchSearchedArticles(filter: name)
    }
}
//
extension SearchPresenter: SearchPresenterInput {
    func apiFetchSuccess(articles: [Article]) {
        self.collectionManager?.setUpCells(articles: articles)
    }

    func handleError(error: Error) {
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: nil)
    }
}

extension SearchPresenter: SearchCollectionViewManagerDelegate {
    
}

extension SearchPresenter: SearchBarManagerDelegate {
    func searchClicked(name: String) {
        interactor?.fetchSearchedArticles(filter: name)
    }
}
