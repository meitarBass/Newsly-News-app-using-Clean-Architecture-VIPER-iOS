//
//  CategoriesViewInput.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

// Presenter to View
protocol CategoriesViewInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
}
