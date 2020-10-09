//
//  FavouritesInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class FavouritesInteractor: FavouritesInteractorInput {
    
    var presenter: FavouritesPresenterInput?
    
    var apiManager: NetworkService<ArticleEndpoint>?
    var dataBaseManager: DataBaseService?
    var storageManager: StorageService?
    
    func fetchFavouritesArticles() {
        // MARK: Todo - Change it to fetch from firebase
        apiManager?.networkRequest(from: .getTopHeadlines, modelType: ArticlesModel.self, completion: {[weak self] (result) in
            DispatchQueue.main.async {[weak self] in
                switch result {
                case .success(let articlesModel):
                    self?.presenter?.ApiFetchSuccess(articles: articlesModel.articles)
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
        })
    }
    
    func searchByName(by name: String, articles: [Article]) -> [Article] {
        var filteredList = [Article]()
        filteredList = articles.filter { (articleToFilter) in
            guard let title = articleToFilter.title else { return false }
            return title.contains(name)
        }
        return filteredList
    }
    
    func loadFavouriteArticles() -> [Article]? {
        return dataBaseManager?.loadFavouriteArticles()
    }
    
    func loadProfileImage() -> UIImage? {
        return storageManager?.loadUserImage()
    }
    
}
