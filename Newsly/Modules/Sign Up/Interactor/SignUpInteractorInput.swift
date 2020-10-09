//
//  SignUpInteractorInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import Foundation
import UIKit

protocol SignUpInteractorInput {
    func signUp(email: String, password: String, image: UIImage, fullName: String)
}
