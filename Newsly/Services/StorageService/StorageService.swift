//
//  StorageService.swift
//  Newsly
//
//  Created by Meitar Basson on 09/10/2020.
//

import Foundation
import FirebaseStorage
import Firebase


class StorageService {
    
    static let shared = StorageService()
    private let userID = Firebase.Auth.auth().currentUser?.uid ?? ""
    private init() {}
    
    
    func saveImageToStorage(image: UIImage, completion: ((_ url: String) -> ())?) {
            guard let imageData = image.jpegData(compressionQuality: 0.2) else { return }
            
            let imageRef = Storage.storage().reference().child(userID)
            
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            
            imageRef.putData(imageData, metadata: metaData) { (metaData, error) in
                if let error = error {
                    debugPrint(error)
                    return
                } 
            }
        }
        
        func downloadImageFromStorage(imageURL: String?, completion: @escaping (UIImage?) -> Void) {
            // NEED TO FIGURE OUT HOW TO RESTORE IT FROM THE CLOSURE
            let MAX_DATA_SIZE: Int64 = 1 * 1024 * 1024
            guard let url = imageURL else { return }
        
            let httpsReference = Storage.storage().reference(forURL: url)
            
            httpsReference.getData(maxSize: MAX_DATA_SIZE) { (data, error) in
                if let error = error {
                    debugPrint(error)
                } else {
                    let image = UIImage(data: data!)
                    completion(image)
                }
            }
        }

}


