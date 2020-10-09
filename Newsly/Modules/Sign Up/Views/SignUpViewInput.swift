//
//  SignUpViewInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//
import UIKit
// Presenter to View
protocol SignUpViewInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
    func updateImage(image: UIImage)
}
