//
//  DataBaseService.swift
//  Newsly
//
//  Created by Meitar Basson on 09/10/2020.
//

import Foundation
import FirebaseFirestore
import Firebase
//import FirebaseFirestoreSwift

protocol DataBaseServiceProtocol: class {
    func saveFavourite(article: Article)
    //    func saveUserInfo(fullName: String, img: String)
    func loadFavouriteArticles() -> [Article]?
    func queryFavourites(queryBy: String)
    func createNewDataBase()
}

class DataBaseService: DataBaseServiceProtocol {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    private let userID = Firebase.Auth.auth().currentUser?.uid ?? ""
    private let email = Firebase.Auth.auth().currentUser?.email ?? ""
    let name = Firebase.Auth.auth().currentUser?.displayName
    
    
    private init() {}
    func createNewDataBase() {
        
        //        guard let userID = Firebase.Auth.auth().currentUser?.uid,
        //              let email = Firebase.Auth.auth().currentUser?.email else { return }
        //
        //        let name = Firebase.Auth.auth().currentUser?.displayName
        
        db.collection("Users").document(userID).setData([
            "name" : name ?? "",
            "email" : email,
        ])
    }
    
    
    
    
    //    weak var appInteratcor: AppInteractorProtocol?
    
    func saveFavourite(article: Article) {
        
        self.checkIfAlreadyHasArticle(article: article) { [weak self] (isSvaed) in
            if !isSvaed{
                guard let strongSelf = self else { return }
                self?.db.collection("Users").document(strongSelf.userID).collection("Favourites").document().setData([
                    "sourceName" : article.source.name ?? "",
                    "urlImage" : article.urlToImage ?? "",
                    "urlLink" : article.url ?? ""
                ], merge: true)
            }
        }
        
    }
    
    private func deleteSavedArticle(documents: [QueryDocumentSnapshot]) {
        
    }
    
    private func checkIfAlreadyHasArticle(article: Article, completion: @escaping (Bool) -> ()) {
        guard let url = article.url else {
            completion(false)
            return
        }
        let queriedCollection = db.collection("Users").document(userID).collection("Favourites").whereField("urlLink", isEqualTo: url)
    
        queriedCollection.getDocuments() { [weak self] (querySnapShot, error) in
            guard error != nil,
                  let querySnapShot = querySnapShot else {
                
                return }
            if querySnapShot.documents.isEmpty {
                completion(false)
            } else {
                completion(true)
                self?.deleteSavedArticle(documents: querySnapShot.documents)
            }
        }
    }
    
    func loadFavouriteArticles() -> [Article]? {
        //        var favouriteArticles: [Article]?
        //        print("just loaded your favourites items")
        //        return favouriteArticles
        return []
    }
    
    func queryFavourites(queryBy: String) {
        //        <#code#>
    }
} 
