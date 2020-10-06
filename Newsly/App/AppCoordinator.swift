//
//  AppCoordinator.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit


protocol AppCoordinatorProtocol {
    func createLandingPage(scene: UIWindowScene)
    func createHomePages(scene: UIWindowScene)
}

class AppCoordinator {
    var window: UIWindow?
    
    private func createDiscoverVC() -> UINavigationController {
        let discoverViewController = DiscoverAssembly.assemble()
        discoverViewController.title = "Discover"
        discoverViewController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage.tabBarItems.discover, selectedImage:  UIImage.tabBarItems.discover)
        
        return UINavigationController(rootViewController: discoverViewController)
    }
    
    private func createSourcesVC() -> UINavigationController {
        let sourcesViewController = SourcesAssembly.assemble()
        sourcesViewController.title = "Sources"
        sourcesViewController.tabBarItem = UITabBarItem(title: "Sources", image: UIImage.tabBarItems.source, selectedImage: UIImage.tabBarItems.source)
        return UINavigationController(rootViewController: sourcesViewController)
    }
    
    private func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = UIColor.tintColor
        //add more tabs here
        tabBar.viewControllers = [createDiscoverVC(), createSourcesVC()]
        return tabBar
    }
}


extension AppCoordinator: AppCoordinatorProtocol {
    
    func createLandingPage(scene: UIWindowScene) {
       
    }
    
    func createHomePages(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    
}