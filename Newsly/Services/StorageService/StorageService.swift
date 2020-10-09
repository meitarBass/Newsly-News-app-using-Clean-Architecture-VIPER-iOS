//
//  StorageService.swift
//  Newsly
//
//  Created by Meitar Basson on 09/10/2020.
//

import Foundation
import Firebase
//import FirebaseStorage

protocol StorageServiceProtocol {
    func loadUserImage() -> UIImage?
    func saveUserImage(image: UIImage?)
}

class StorageService: StorageServiceProtocol {
    
    func saveUserImage(image: UIImage?) {
//
        print("image saved")
    }
    
    func loadUserImage() -> UIImage? {
//
        print("imageLoaded")
        return nil
    }
}


