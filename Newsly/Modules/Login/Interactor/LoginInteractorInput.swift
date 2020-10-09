//
//  LoginInteractorInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation

protocol SignInInteractorInput {
    func signIn(email: String, password: String)
    func resetPassword(email: String)
}
