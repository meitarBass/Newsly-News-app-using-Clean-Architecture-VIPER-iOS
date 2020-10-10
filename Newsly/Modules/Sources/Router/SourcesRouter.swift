//
//  SourcesRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

//Presenter to Sources
protocol SourcesRouterProtocol {
    var view: UIViewController? { get set }
    
    func createDiscoverSources(sourceName: String)
}


class SourcesRouter: SourcesRouterProtocol {
    
    weak var view: UIViewController?
    func createDiscoverSources(sourceName: String) {
        let discoverView = DiscoverAssembly.assemble(endpoint: .getArticlesFromSource(sourceName))
        discoverView.title = sourceName
        view?.navigationController?.pushViewController(discoverView, animated: true)
    }
    

    
}
