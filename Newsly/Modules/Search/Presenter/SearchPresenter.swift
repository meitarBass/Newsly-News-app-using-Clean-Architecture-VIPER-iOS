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
    var searchControllerManager: searchControllerManagerProtocol?
    var searchBarDelegate: SearchBarManagerDelegate?
}

extension SearchPresenter: SearchPresenterProtocol {
    
    func searchForArticles(by name: String) {
        view?.showActivityIndicator()
        interactor?.fetchSearchedArticles(filter: name)
    }
}
//
extension SearchPresenter: SearchPresenterInput {
    func apiFetchSuccess(articles: [Article]) {
        view?.hideActivityIndicator()
        self.collectionManager?.setUpCells(articles: articles)
    }

    func handleError(error: Error) {
        view?.hideActivityIndicator()
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
    }
}

extension SearchPresenter: SearchCollectionViewManagerDelegate {
    func cellClicked(article: Article?) {
        router?.createWebView(article: article)
    }
}

extension SearchPresenter: SearchBarManagerDelegate {
    func searchClicked(name: String) {
        interactor?.fetchSearchedArticles(filter: name)
    }
}
