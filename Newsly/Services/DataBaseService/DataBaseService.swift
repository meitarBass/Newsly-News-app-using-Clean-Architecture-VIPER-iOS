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
    private let userID = Firebase.Auth.auth().currentUser?.uid ?? ""
    private let email = Firebase.Auth.auth().currentUser?.email ?? ""
    private let name = Firebase.Auth.auth().currentUser?.displayName
    private init() {}
    
    private func saveArticle(article: Article) {
        Firestore.firestore().collection("Users").document(userID).collection("Favourites").document().setData([
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
        Firestore.firestore().collection("Users").document(userID).setData([
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
        let db = Firestore.firestore()
        let queriedCollection = db.collection("Users").document(userID).collection("Favourites").whereField("urlLink", isEqualTo: url)
        print(queriedCollection)
        queriedCollection.getDocuments { (querySnapShot, error) in
            guard error == nil,
                  let querySnapShot = querySnapShot else { return }
            if querySnapShot.documents.isEmpty {
//                completion(false, nil)
            } else {
//                completion(true, querySnapShot.documents)
            }
        }
    }
    
    func loadFavouriteArticles(completion: @escaping ([Article]?) -> ()) {
        //TODO: -  handle error
        var favouriteArticles: [Article] = [Article]()
        Firestore.firestore().collection("Users").document(userID).collection("Favourites").getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error)
                completion(nil)
            }
            
            if let querySnpashot = querySnapshot {
                for article in querySnpashot.documents {
                    let data = article.data()
                    
                    guard let sourceName = data["sourceName"] as? String,
                          let title = data["title"] as? String,
                          let url = data["urlLink"] as? String,
                          let urlToImage = data["urlImage"] as? String?
                    else { return }
                    let source = Source(name: sourceName)
                    let article = Article(source: source, title: title, description: nil, url: url, urlToImage: urlToImage)
                    favouriteArticles.append(article)
                }
                completion(favouriteArticles)
            }
        }
        
    }
} 
