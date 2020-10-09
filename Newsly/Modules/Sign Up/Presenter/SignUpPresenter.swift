//
//  SignUpPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation
import UIKit

class SignUpPresenter {
    
    var router : SignUpRouterProtocol?
    weak var view: SignUpViewInput?
    var interactor: SignUpInteractorInput?
    
}

extension SignUpPresenter: SignUpPresenterProtocol {
    
    func alreadyHaveAccount() {
        router?.createLoginPage()
    }
    
    // MARK: Need to consider using data type from now on instead of UIImage (to prevent loading UIKit)
    func register(email: String?, password: String?, image: UIImage?) {
        guard
            let email = email,
            let password = password,
            let image = image else { return }
        interactor?.signUp(email: email, password: password, image: image)
    }
}

extension SignUpPresenter: SignUpPresenterInput {
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        self.view?.presentAlert(title: title, message: message, action: action)
    }
}
