//
//  FavouritesInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class FavouritesInteractor: FavouritesInteractorInput {
  
    var presenter: FavouritesPresenterInput?
    var profileManager: ProfileServiceProtocol?
    
    
    func searchByName(by name: String, articles: [Article]) -> [Article] {
        var filteredList = [Article]()
        filteredList = articles.filter { (articleToFilter) in
            guard let title = articleToFilter.title else { return false }
            return title.contains(name)
        }
        return filteredList
    }
    
    func loadFavouriteArticles(completion: @escaping ([Article]?) -> ()) {
        DataBaseService.shared.loadFavouriteArticles { articles in
            completion(articles)
        }
    }
    
    func loadProfileImage() -> UIImage? {
        return nil
    }
    
    func getUserInfo() -> (name: String?, email: String?) {
        guard let profileManager = profileManager else { return (nil, nil) }
        return profileManager.getUserInfo()
    }
    
}
