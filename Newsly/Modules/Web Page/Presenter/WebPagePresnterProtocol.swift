//
//  WebPagePresnterProtocol.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 08.10.2020.
//

import Foundation



// View To Presenter
protocol WebPagePresenterProtocol: class {
    func viewDidLoad()
    func saveArticle()
    func isArticleSaved()
}

// Interactor To Presenter
protocol WebPagePresenterInput: class {
    func changeFavouriteState(state: Bool)
    func isArticleSaved(state: Bool)
}

//
protocol WebPageInteractorDelegate: class {
    func saveArticle()
    
}
