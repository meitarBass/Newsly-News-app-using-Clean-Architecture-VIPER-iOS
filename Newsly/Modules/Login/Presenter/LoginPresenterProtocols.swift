//
//  LoginPresenterProtocols.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation
// View To Presenter
protocol SignInPresenterProtocol: class {
    func signIn(email: String?, password: String?)
}

// Interactor To Presenter
protocol SignInPresenterInput: class {
}

//
protocol SignInTextFieldsManagerDelegate: class {
}
