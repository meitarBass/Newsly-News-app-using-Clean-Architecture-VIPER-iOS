//
//  WebPageInteractor.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 08.10.2020.
//

import Foundation

class WebPageInteractor: WebPageInteractorProtocol {
    
    weak var presenter: WebPagePresenterInput?
    
    func saveArticle(article: Article?) {
        guard let article = article else { return }
//        DataBaseService.shared.updateDataBase(article: article) {[weak self] updateType in
//            switch updateType {
//            case .deleted:
//                self?.presenter?.changeFavouriteState(state: false)
//            case .saved:
//                self?.presenter?.changeFavouriteState(state: true)
//            }
//        }
    }
    
    func isArticleSaved(article: Article?) {
        guard let article = article else { return }
        DataBaseService.shared.checkIfAlreadyHasArticle(article: article) {[weak self] (isLiked, nil) in
            if isLiked {
                self?.presenter?.isArticleSaved(state: true)
            } else {
                self?.presenter?.isArticleSaved(state: false)
            }
        }
    }
}
