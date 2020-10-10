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
    
    
    func saveImageToStorage(image: UIImage?, completion: ((_ url: String) -> ())?) {
            guard let imageData = image?.jpegData(compressionQuality: 0.2) else { return }
            
            let imageRef = Storage.storage().reference().child(userID)
            
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            
            imageRef.putData(imageData, metadata: metaData) { (metaData, error) in
                if let error = error {
                    debugPrint(error)
                    return
                }
                
                completion?("completed")
            }
        }
        
        func downloadImageFromStorage(completion: @escaping (UIImage?) -> Void) {
            let MAX_DATA_SIZE: Int64 = 1 * 1024 * 1024
            let profileRef = Storage.storage().reference().child(userID)
            
            profileRef.getData(maxSize: MAX_DATA_SIZE) { (data, error) in
                if let error = error {
                    debugPrint(error)
                } else {
                    let image = UIImage(data: data!)
                    completion(image)
                }
            }
        }
}


