//
//  SignUpAassembly.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class SignUpAssembly {
    static func assemble() -> UIViewController {
        let view = SignUpViewController()
        let router = SignUpRouter()
        let presenter = SignUpPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        router.view = view
        return view
    }
}
