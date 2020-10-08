//
//  DiscoverPresenter.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import Foundation


class DiscoverPresenter {
    
    weak var view: DiscoverViewInput?
    var interactor: DiscoverInteractorInput?
    var router: DiscoverRouterProtocol?
    var collectionManager: DiscoverCollectionViewManagerProtocol?
    
}

//MARK: - DiscoverPresenterProtocol
extension DiscoverPresenter: DiscoverPresenterProtocol {
    func viewDidLoad() {
        view?.showActivityIndicator()
        interactor?.fetchTrendingArticles()
    }
    
}

//MARK: - DiscoverPresenterInput
extension DiscoverPresenter: DiscoverPresenterInput {
    func apiFetchSuccess(articles: [Article]) {
        view?.hideActivityIndicator()
        self.collectionManager?.setupChats(articles: articles)
    }
    
    func handleError(error: Error) {
        view?.hideActivityIndicator()
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
    }
    
    
}


//MARK: - DiscoverCollectionViewManagerDelegate
extension DiscoverPresenter: DiscoverCollectionViewManagerDelegate {
    func cellClicked(urlString: String?, sourceName: String?) {
        router?.createWebView(urlString: urlString, sourceName: sourceName)
    }
    
    
}
