//
//  DataBaseService.swift
//  Newsly
//
//  Created by Meitar Basson on 09/10/2020.
//

import Foundation
import Firebase

protocol DataBaseServiceProtocol: class {
    func saveFavourite(article: Article)
//    func saveUserInfo(fullName: String, img: String)
    func loadFavouriteArticles() -> [Article]?
    func queryFavourites(queryBy: String)
}

class DataBaseService: DataBaseServiceProtocol {
    
//    weak var appInteratcor: AppInteractorProtocol?

    
    func saveFavourite(article: Article) {
//        <#code#>
        print("Data saved")
    }
    
    func loadFavouriteArticles() -> [Article]? {
//        <#code#>
        print("Got articles")
        return nil
    }
    
    func queryFavourites(queryBy: String) {
//        <#code#>
    }
}
