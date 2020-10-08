//
//  SearchViewInput.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

protocol SearchViewInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
    func showActivityIndicator()
    func hideActivityIndicator()
}
