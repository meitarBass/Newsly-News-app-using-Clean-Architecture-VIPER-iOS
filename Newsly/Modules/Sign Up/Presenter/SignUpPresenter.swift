//
//  SignUpPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

class SignUpPresenter {
    
    var router : SignUpRouterProtocol?
    weak var view: SignUpViewInput?
    var interactor: SignUpInteractorInput?
    
}

extension SignUpPresenter: SignUpPresenterProtocol {
    func alreadyHaveAccount() {
        router?.createLoginPage()
    }
    
    func register(email: String?, password: String?) {
        guard
             let email = email,
            let password = password else { return }
        interactor?.signUp(email: email, password: password)
    }
}

extension SignUpPresenter: SignUpPresenterInput {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.view?.presentAlert(title: title, message: message, action: action)
    }
}
