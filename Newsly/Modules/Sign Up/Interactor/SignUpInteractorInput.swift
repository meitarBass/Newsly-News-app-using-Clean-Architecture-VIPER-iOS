//
//  SignUpInteractorInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation


protocol SignUpInteractorInput {
    func signUp(email: String, password: String)
}


final class SignUpInteractor: SignUpInteractorInput {
   
   var profileService: ProfileServiceProtocol?
    
    func signUp(email: String, password: String) {
        profileService?.signUp(email: email, password: password)
    }
    
}
