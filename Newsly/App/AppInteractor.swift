//
//  AppInteractor.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

protocol APPInteractorProtocol {
//    func checkIfUserIsAuthenticated()
}

class AppInteractor: APPInteractorProtocol {
    
    private var coordinator: AppCoordinatorProtocol?
    private var windowScene: UIWindowScene!
    
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
        self.coordinator = AppCoordinator()
        self.checkIfUserisAuthenticated()
    }
    
    private func checkIfUserisAuthenticated() {
        //perform check from firebase
        
//        coordinator?.createHomePages(scene: windowScene)
        
        coordinator?.createLandingPage(scene: windowScene)
    }
    
}


