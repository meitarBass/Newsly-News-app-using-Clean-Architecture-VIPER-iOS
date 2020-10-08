//
//  SearchRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

protocol SearchRouterProtocol {
    var view: UIViewController? { get set }
    func createWebView(urlString: String?)
}

class SearchRouter: SearchRouterProtocol {    
    weak var view: UIViewController?
    
    func createWebView(urlString: String?) {
        let webView = WebPageViewAssembly.assemble(urlString: urlString)
        view?.navigationController?.pushViewController(webView, animated: true)
    }
}
