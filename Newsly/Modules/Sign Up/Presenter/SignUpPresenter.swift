//
//  SignUpPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

class SignUpPresenter {
    
    var router : SignUpRouterProtocol?
    var view: SignUpViewInput?
    
}

extension SignUpPresenter: SignUpPresenterProtocol {
    func alreadyHaveAccount() {
        router?.createLoginPage()
    }
    
    func register() {
        
    }
    
    
}

extension SignUpPresenter: SignUpPresenterInput {
    
}

extension SignUpPresenter: SignUpTextFieldsManagerDelegate {
    
}
