//
//  FavouritesInteractorInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

protocol FavouritesInteractorInput {
    func searchByName(by name: String, articles: [Article]) -> [Article]
    
    func fetchFavouritesArticles()
    func loadFavouriteArticles() -> [Article]?
    func loadProfileImage() -> UIImage?
}
