//
//  LoginPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation


class SignInPresenter {
    
    weak var view: LoginViewInput?
    var interactor: SignInInteractorInput?
    
}

extension SignInPresenter: SignInPresenterProtocol {
    func signIn(email: String?, password: String?) {
        guard
             let email = email,
            let password = password else { return }
        interactor?.signIn(email: email, password: password)
    }
    
    
}

extension SignInPresenter: SignInPresenterInput {
    
}

extension SignInPresenter: SigninDelegate {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.view?.presentAlert(title: title, message: message, action: action)
    }
}
