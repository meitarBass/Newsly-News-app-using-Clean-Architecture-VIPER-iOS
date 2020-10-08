//
//  SignUpInteractor.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation


final class SignUpInteractor: SignUpInteractorInput {
   
   var profileService: ProfileServiceProtocol?
    
    func signUp(email: String, password: String) {
        profileService?.signUp(email: email, password: password)
    }
    
}
