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
        let discoverViewController = DiscoverAssembly.assemble(endpoint: .getTopHeadlines)
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
    
    private func createSearchVC() -> UINavigationController {
        let searchViewController = SearchAssembly.assemble()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage.tabBarItems.search, selectedImage: UIImage.tabBarItems.search)
        return UINavigationController(rootViewController: searchViewController)
    }
    
    private func createFavouritesVC() -> UINavigationController {
        let favouritesViewController = SearchAssembly.assemble()
        favouritesViewController.title = "Faourites"
        favouritesViewController.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage.tabBarItems.favourite, selectedImage: UIImage.tabBarItems.favourite)
        return UINavigationController(rootViewController: favouritesViewController)
    }
    
    private func createCategoriesVC() -> UINavigationController {
        let favouritesViewController = CategoriesAssembly.assemble()
        favouritesViewController.title = "Categories"
        favouritesViewController.tabBarItem = UITabBarItem(title: "Categories", image: UIImage.tabBarItems.discover, selectedImage: UIImage.tabBarItems.discover)
        return UINavigationController(rootViewController: favouritesViewController)
    }
    
    private func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = UIColor.tintColor
        //add more tabs here
        tabBar.viewControllers = [createDiscoverVC(), createSourcesVC(), createSearchVC(), createFavouritesVC(), createCategoriesVC()]
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
