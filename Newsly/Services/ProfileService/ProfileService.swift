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
    func signUp(email: String, password: String, fullName: String, image: UIImage)
    func signOut()
    func resetPassword(email: String)
    func checkIfUserIsAuth() -> Bool
    func getUserInfo() -> (name: String?, email: String?)
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
                self?.loginDelegate?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
            }
          
            guard result != nil else {
                self?.loginDelegate?.presentAlert(title: "error", message: "Couldn't complete sign in", action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
                return
            }
            
            self?.loginDelegate?.presentAlert(title: "Welcome Back", message: "We are glad to have you here", action: ActionAlertModel(actionText: "Cancel", actionHandler: { [weak self] in
                self?.appInteratcor?.checkIfUserisAuthenticated()
                
            }))
            
        }
    }
    
    func signUp(email: String, password: String, fullName: String, image: UIImage) {
        Firebase.Auth.auth().createUser(withEmail: email, password: password) {[weak self] (result, error) in
            if let error = error {
                self?.signUpDelegate?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
            }
            guard result != nil else {
                self?.signUpDelegate?.presentAlert(title: "error", message: "Couldn't Sign In", action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
                return
            }
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = fullName
            changeRequest?.commitChanges {  (error) in
                
                DataBaseService.shared.createNewDataBase()
                
            }
            
            self?.signUpDelegate?.presentAlert(title: "Signed up successfuly", message: "Welcome to our community!", action: ActionAlertModel(actionText: "Cancel", actionHandler: { [weak self] in
                self?.appInteratcor?.checkIfUserisAuthenticated()
                StorageService.shared.saveImageToStorage(image: image, completion: nil)
            }))
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            self.signUpDelegate?.presentAlert(title: "error", message: signOutError.description, action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
        }
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) {[weak self] (error) in
            if let error = error {
                self?.signUpDelegate?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
            } else {
                self?.signUpDelegate?.presentAlert(title: "Password was reset successfully", message: "please check your email", action: ActionAlertModel(actionText: "Cancel", actionHandler: {}))
            }
        }
    }
    
    func getUserInfo() -> (name: String?, email: String?) {
        (Firebase.Auth.auth().currentUser?.displayName, Firebase.Auth.auth().currentUser?.email)
    }
    
}
