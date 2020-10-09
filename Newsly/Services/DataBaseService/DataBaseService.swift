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
    func isArticleSaved(article: Article)
    func queryFavourites(queryBy: String)
}

class DataBaseService: DataBaseServiceProtocol {
    
//    weak var appInteratcor: AppInteractorProtocol?

    
    func saveFavourite(article: Article) {
//        <#code#>
    }
    
    func isArticleSaved(article: Article) {
//        <#code#>
    }
    
    func queryFavourites(queryBy: String) {
//        <#code#>
    }
}
