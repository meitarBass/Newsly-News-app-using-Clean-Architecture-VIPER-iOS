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
    func createWebView(urlString: String?, sourceName: String?) 
}


class DiscoverRouter: DiscoverRouterProtocol {
    weak var view: UIViewController?
    
    
    func createWebView(urlString: String?, sourceName: String?) {
        let webView = WebPageViewAssembly.assemble(urlString: urlString, sourceName: sourceName)
        view?.navigationController?.pushViewController(webView, animated: true)
    }
}
