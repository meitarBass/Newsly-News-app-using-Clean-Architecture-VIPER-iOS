//
//  LoginViewinput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation


protocol LoginViewInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
}
