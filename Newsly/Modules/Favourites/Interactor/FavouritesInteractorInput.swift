//
//  FavouritesInteractorInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

protocol FavouritesInteractorInput {
    func fetchFavouritesArticles()
    func searchByName(by name: String, articles: [Article]) -> [Article]
}
