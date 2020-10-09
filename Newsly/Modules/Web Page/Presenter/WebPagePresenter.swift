//
//  WebPagePresenter.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 08.10.2020.
//

import Foundation

class WebPagePresenter {
    
    weak var view: WebPageViewInput?
    var urlString: String?
    var article: Article?
    var interactor: WebPageInteractorProtocol?
}

extension WebPagePresenter: WebPagePresenterProtocol {
    func viewDidLoad() {
        guard let urlString = self.urlString else { return }
        self.view?.showWebPage(url: urlString)
    }
}

extension WebPagePresenter: WebPagePresenterInput {
    func changeFavouriteState(state: Bool) {
        view?.changeFavouriteState(state: state)
    }
}

extension WebPagePresenter: WebPageInteractorDelegate {
    func saveArticle() {
        interactor?.saveArticle(article: article)
    }
}
