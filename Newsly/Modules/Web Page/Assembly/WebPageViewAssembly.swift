//
//  WebViewAssembly.swift
//  Newsly
//
//  Created by Meitar Basson on 08/10/2020.
//

import UIKit

class WebPageViewAssembly {
    public static func assemble(article: Article?) -> UIViewController {
        
        let view = WebPageViewController()
        let presenter = WebPagePresenter()
        let interactor = WebPageInteractor()
        
        view.title = article?.source.name
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.article = article
        presenter.view = view
        presenter.urlString = article?.url
        
        interactor.presenter = presenter
        
        return view
    }
}
