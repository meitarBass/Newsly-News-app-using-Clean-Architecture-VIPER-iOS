//
//  LoginInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

final class SignInInteractor: SignInInteractorInput {
    
    var profileService: ProfileServiceProtocol?
    weak var presenter: SignInPresenterInput?
    
    func signIn(email: String, password: String) {
        profileService?.signIn(email: email, password: password)
    }
    
    func resetPassword(email: String) {
        profileService?.resetPassword(email: email)
    }
    
}

extension SignInInteractor: SigninDelegate {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.presenter?.presentAlert(title: title, message: message, action: action)
    }
}
