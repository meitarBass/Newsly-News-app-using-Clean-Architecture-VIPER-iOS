//
//  ProfileService.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 09.10.2020.
//

import Foundation
import Firebase


protocol ProfileServiceProtocol: class {
    func signIn(email: String, password: String)
    func signUp(email: String, password: String)
    func checkIfUserIsAuth() -> Bool
}

protocol SigninDelegate: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
    
}

protocol SignUpDelegate: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
    
}

class ProfileService: ProfileServiceProtocol {

    weak var appInteratcor: AppInteractorProtocol?
    weak var loginDelegate: SigninDelegate?
    weak var signUpDelegate: SignUpDelegate?
    
    func checkIfUserIsAuth() -> Bool {
        if Firebase.Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
        
    }
    
    func signIn(email: String, password: String) {
        Firebase.Auth.auth().signIn(withEmail: email, password: password) {[weak self] (result, error) in
            if let error = error {
                self?.loginDelegate?.presentAlert(title: "Error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
            }
          
            guard result != nil else {
                self?.loginDelegate?.presentAlert(title: "Error", message: "Couldn't complete sign in", action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
                return
            }
            
            self?.loginDelegate?.presentAlert(title: "Error", message: "SignUpSuccessful", action: ActionAlertModel(actionText: "Cancel", actionHandler: { [weak self] in
                self?.appInteratcor?.checkIfUserisAuthenticated()
                
            }))
            
        }
    }
    
    func signUp(email: String, password: String) {
        Firebase.Auth.auth().createUser(withEmail: email, password: password) {[weak self] (result, error) in
            if let error = error {
                self?.signUpDelegate?.presentAlert(title: "Error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
            }
            guard result != nil else {
                self?.signUpDelegate?.presentAlert(title: "Error", message: "Couldn't Sign In", action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
                return
            }
            
            self?.signUpDelegate?.presentAlert(title: "Error", message: "SignUpSuccessful", action: ActionAlertModel(actionText: "Cancel", actionHandler: { [weak self] in
                self?.appInteratcor?.checkIfUserisAuthenticated()
                
            }))
           
            
        }
    }
    
    
    
}
