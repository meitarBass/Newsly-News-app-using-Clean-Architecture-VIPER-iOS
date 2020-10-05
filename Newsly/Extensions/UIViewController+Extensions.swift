//
//  UIViewController+Extensions.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

struct ActionAlertModel {
    let actionText: String
    let actionHandler: () -> ()
}


extension UIViewController {
    
    func presentAlert(title: String, message: String, action: ActionAlertModel?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let action = action {
            alert.addAction(UIAlertAction(title: action.actionText, style: .default, handler: { UIAlertAction in
                action.actionHandler()
            }))
        }
        present(alert, animated: true, completion: nil)
    }
}
