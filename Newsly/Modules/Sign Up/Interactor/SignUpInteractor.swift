//
//  SignUpInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

final class SignUpInteractor: SignUpInteractorInput {
    
    var profileService: ProfileServiceProtocol?
    
    var presenter: SignUpPresenterInput?
    
    func signUp(email: String, password: String, image: UIImage, fullName: String) {
        //MARK: Need to check if the sign up was successful, only then save the image
        //MARK: Could add completion handler for the sign up
        profileService?.signUp(email: email, password: password, fullName: fullName, image: image)
    }
    
}

extension SignUpInteractor: SignUpDelegate {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.presenter?.presentAlert(title: title, message: message, action: action)
    }
}

