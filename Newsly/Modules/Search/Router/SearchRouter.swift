//
//  SearchRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

protocol SearchRouterProtocol {
    var view: UIViewController? { get set }
    func createWebView(article: Article?)
}

class SearchRouter: SearchRouterProtocol {    
    weak var view: UIViewController?
    
    func createWebView(article: Article?) {
        let webView = WebPageViewAssembly.assemble(article: article)
        view?.navigationController?.pushViewController(webView, animated: true)
    }
}
