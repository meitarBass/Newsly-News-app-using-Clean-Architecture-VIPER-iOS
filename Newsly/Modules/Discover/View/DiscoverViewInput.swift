//
//  DiscoverViewInput.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

//presenter to view
protocol DiscoverViewInput: class {
    func presentAlert(title: String, message: String, action: ActionAlertModel?)
}



