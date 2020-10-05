//
//  DiscoverInteractor.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import Foundation


class DiscoverInteractor: DiscoverInteractorInput {
    
    weak var presenter: DiscoverPresenterInput?
    var apiManager: NetworkService<ArticleEndpoint>?
    
    func fetchTrendingArticles() {
        apiManager?.networkRequest(from: .getTopHeadlines, modelType: ArticlesModel.self, completion: { [weak self] (result) in
            DispatchQueue.main.async {[weak self] in
                switch result {
                case .success(let articleModel):
                    self?.presenter?.apiFetchSuccess(articles: articleModel.articles)
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
        })
        
    }
}

