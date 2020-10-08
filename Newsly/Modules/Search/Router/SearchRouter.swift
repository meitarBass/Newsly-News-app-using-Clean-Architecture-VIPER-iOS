//
//  SearchRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

protocol SearchRouterProtocol {
    var view: UIViewController? { get set }
    func createWebView(urlString: String?, sourceName: String?)
}

class SearchRouter: SearchRouterProtocol {    
    weak var view: UIViewController?
    
    func createWebView(urlString: String?, sourceName: String?) {
        let webView = WebPageViewAssembly.assemble(urlString: urlString, sourceName: sourceName)
        view?.navigationController?.pushViewController(webView, animated: true)
    }
}
