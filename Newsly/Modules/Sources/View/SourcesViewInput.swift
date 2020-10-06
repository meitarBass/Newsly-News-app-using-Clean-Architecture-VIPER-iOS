//
//  SourcesViewInput.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

// Presenter To View

protocol SourcesViewInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
}
