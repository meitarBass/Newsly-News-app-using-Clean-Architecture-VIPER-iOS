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
        let interactor = SignUpInteractor()
        let profileService: ProfileService? = ServiceLocator.shared.getService()
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.profileService = profileService
        interactor.presenter = presenter
        
        profileService?.signUpDelegate = interactor
        
        router.view = view
        return view
    }
}
