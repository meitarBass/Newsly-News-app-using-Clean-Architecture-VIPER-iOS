//
//  SignUpInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

final class SignUpInteractor: SignUpInteractorInput {
   
    var profileService: ProfileServiceProtocol?
    var presenter: SignUpPresenterInput?
    
    func signUp(email: String, password: String) {
        profileService?.signUp(email: email, password: password)
    }
}

extension SignUpInteractor: SignUpDelegate {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.presenter?.presentAlert(title: title, message: message, action: action)
    }
}

