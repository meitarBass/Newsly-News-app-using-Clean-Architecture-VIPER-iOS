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


enum UpdatedType {
    case deleted
    case saved
}

class DataBaseService {
    
    //MARK: - private properties
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    private let userID = Firebase.Auth.auth().currentUser?.uid ?? ""
    private let email = Firebase.Auth.auth().currentUser?.email ?? ""
    private let name = Firebase.Auth.auth().currentUser?.displayName
    private init() {}
    
    private func saveArticle(article: Article) {
        self.db.collection("Users").document(userID).collection("Favourites").document().setData([
            "sourceName" : article.source.name ?? "",
            "urlImage" : article.urlToImage ?? "",
            "urlLink" : article.url ?? "",
            "title" : article.title ?? ""
        ], merge: true)
    }
    
    private func deleteSavedArticle(documents: [QueryDocumentSnapshot]?) {
        guard let documents = documents else { return }
        for document in documents {
            document.reference.delete()
        }
    }
    
    //MARK: - singletonProperties
    
    func createNewDataBase() {
        db.collection("Users").document(userID).setData([
            "name" : name ?? "",
            "email" : email,
        ])
    }
    
    func updateDataBase(article: Article, completion: @escaping (UpdatedType) ->() ) {
        self.checkIfAlreadyHasArticle(article: article) { [weak self] (isSvaed, queriedDocuments) in
            if isSvaed{
                self?.deleteSavedArticle(documents: queriedDocuments)
                completion(.deleted)
            } else {
                self?.saveArticle(article: article)
                completion(.saved)
            }
        }
        
    }

    func checkIfAlreadyHasArticle(article: Article, completion: @escaping (Bool, [QueryDocumentSnapshot]?) -> ()) {
        guard let url = article.url else {
            completion(false, nil)
            return
        }
        let queriedCollection = db.collection("Users").document(userID).collection("Favourites").whereField("urlLink", isEqualTo: url)
        print(queriedCollection)
        queriedCollection.getDocuments() { (querySnapShot, error) in
            guard error == nil,
                  let querySnapShot = querySnapShot else {
                
                return }
            if querySnapShot.documents.isEmpty {
                completion(false, nil)
            } else {
                completion(true, querySnapShot.documents)
            }
        }
    }
    
    func loadFavouriteArticles(completion: @escaping ([Article]?) -> ()) {
      
        
        
    }
} 
