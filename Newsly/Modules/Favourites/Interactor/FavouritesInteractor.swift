//
//  FavouritesInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class FavouritesInteractor: FavouritesInteractorInput {

    weak var presenter: FavouritesPresenterInput?
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
    
    func loadProfileImage(completion: @escaping (UIImage?) -> ()) {
         return StorageService.shared.downloadImageFromStorage { (image) in
             completion(image)
         }
     }
     
    func getUserInfo() -> (name: String?, email: String?) {
        guard let profileManager = profileManager else { return (nil, nil) }
        return profileManager.getUserInfo()
    }
    
    func saveImageToDataBase(image: UIImage?, completion: @escaping() -> ()) {
        StorageService.shared.saveImageToStorage(image: image) { (_) in
           completion()
        }
    }
    
    func signOut() {
        profileManager?.signOut()
    }
}
