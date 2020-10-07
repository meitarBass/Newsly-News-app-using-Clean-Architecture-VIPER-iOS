//
//  SignUpRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

protocol SignUpRouterProtocol {
    var view: UIViewController? { get set }
    func createLoginPage()
}

class SignUpRouter: SignUpRouterProtocol {
    weak var view: UIViewController?
    
    func createLoginPage() {
        let loginView = LoginAssembly.assemble()
        view?.navigationController?.pushViewController(loginView, animated: true)
    }
}
