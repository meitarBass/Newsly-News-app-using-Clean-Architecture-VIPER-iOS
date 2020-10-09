//
//  DiscoverRouter.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

//presenter to router
protocol DiscoverRouterProtocol {
    var view: UIViewController? { get set }
    func createWebView(article: Article?)
}


class DiscoverRouter: DiscoverRouterProtocol {
    weak var view: UIViewController?
    
    
    func createWebView(article: Article?) {
        let webView = WebPageViewAssembly.assemble(article: article)
        view?.navigationController?.pushViewController(webView, animated: true)
    }
}
