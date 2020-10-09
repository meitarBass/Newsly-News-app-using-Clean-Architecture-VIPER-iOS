//
//  SignUpPresenterProtcols.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation
import UIKit

// View To Presenter
protocol SignUpPresenterProtocol: class {
    func alreadyHaveAccount()
    func register(email: String?, password: String?, image: UIImage?)
}

// Interactor To Presenter
protocol SignUpPresenterInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
}

//
protocol SignUpTextFieldsManagerDelegate: class {
}
