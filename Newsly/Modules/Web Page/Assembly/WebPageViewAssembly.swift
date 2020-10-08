//
//  WebViewAssembly.swift
//  Newsly
//
//  Created by Meitar Basson on 08/10/2020.
//

import UIKit

class WebPageViewAssembly {
    public static func assemble(urlString: String?, sourceName: String?) -> UIViewController {
        let view = WebPageViewController()
        view.title = sourceName
        let presenter = WebPagePresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.urlString = urlString
        return view
    }
}
