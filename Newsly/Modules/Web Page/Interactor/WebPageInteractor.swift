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
        DataBaseService.shared.updateDataBase(article: article) {[weak self] updateType in
            switch updateType {
            case .deleted:
                self?.presenter?.changeFavouriteState(state: false)
            case .saved:
                self?.presenter?.changeFavouriteState(state: true)
            }
        }
    }
}
