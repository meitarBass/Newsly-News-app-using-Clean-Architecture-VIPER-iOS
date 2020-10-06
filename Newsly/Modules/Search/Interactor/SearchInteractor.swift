//
//  SearchInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import Foundation

class SearchInteractor: SearchInteractorInput {
    
    weak var presenter: SearchPresenterInput?
    var apiManager: NetworkService<ArticleEndpoint>?
    
    func fetchSearchedArticles(filter: String) {
        apiManager?.networkRequest(from: .searchForArticles(searchFilter: filter), modelType: ArticlesModel.self) { [weak self] (result) in
            DispatchQueue.main.async { [weak self] in
                switch result {
                
                case .success(let searchModel):
                    self?.presenter?.apiFetchSuccess(articles: searchModel.articles)
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
            
        }
    }
}
