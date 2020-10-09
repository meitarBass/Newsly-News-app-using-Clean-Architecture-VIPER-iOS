//
//  AppInteractor.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit
import Firebase

protocol AppInteractorProtocol: class {
    func checkIfUserisAuthenticated()
}

class AppInteractor: AppInteractorProtocol {
    
    private var coordinator: AppCoordinatorProtocol?
    private var windowScene: UIWindowScene!
    private var profileService: ProfileServiceProtocol?
    
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
        setupFirebase()
        self.setupServiceLocator()
        self.coordinator = AppCoordinator()
        self.checkIfUserisAuthenticated()
    }
    
    
    private func setupFirebase() {
        FirebaseApp.configure()
    }
    
    private func setupServiceLocator() {
        let networkService = NetworkService<ArticleEndpoint>()
        ServiceLocator.shared.addService(service: networkService as NetworkService)
        
        let profileService = ProfileService()
        self.profileService = profileService
        profileService.appInteratcor = self
        ServiceLocator.shared.addService(service: profileService as ProfileService)
        
//        let dataBaseService = DataBaseService()
//        ServiceLocator.shared.addService(service: dataBaseService as DataBaseService)
        
        let storageService = StorageService()
        ServiceLocator.shared.addService(service: storageService as StorageService)
    }
    
     func checkIfUserisAuthenticated() {
        //perform check from firebase
        
        guard let profileService = profileService else { return }
        if profileService.checkIfUserIsAuth() {
            coordinator?.createHomePages(scene: windowScene)
        } else {
            coordinator?.createLandingPage(scene: windowScene)
        }
    }
    
}


