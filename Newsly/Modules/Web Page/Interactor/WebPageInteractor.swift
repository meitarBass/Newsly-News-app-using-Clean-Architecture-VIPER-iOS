//
//  WebPageInteractor.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 08.10.2020.
//

import Foundation

class WebPageInteractor: WebPageInteractorProtocol {
    
    var dataBaseService: DataBaseService?
    
    func saveArticle(article: Article?) {
        guard let article = article else { return }
//        DataBaseService.shared.createNewDataBase()
        DataBaseService.shared.saveFavourite(article: article)
    }
}
