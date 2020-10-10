//
//  ImagePickerManager.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 10.10.2020.
//

import UIKit


protocol ImagePickerManagerDelegate: class {
    func imageGotten(image: UIImage)
}

final class ImagePickerManager: NSObject {
    weak var delegate: ImagePickerManagerDelegate?
}


extension ImagePickerManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        delegate?.imageGotten(image: image)
        picker.dismiss(animated: true, completion: nil)
    }
}
