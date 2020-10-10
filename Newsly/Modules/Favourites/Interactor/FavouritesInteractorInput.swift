//
//  FavouritesInteractorInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

protocol FavouritesInteractorInput {
    func searchByName(by name: String, articles: [Article]) -> [Article]
    func loadFavouriteArticles(completion: @escaping ([Article]?) -> ())
    func loadProfileImage(completion: @escaping (UIImage?) -> ())
    func getUserInfo() -> (name: String?, email: String?)
}
