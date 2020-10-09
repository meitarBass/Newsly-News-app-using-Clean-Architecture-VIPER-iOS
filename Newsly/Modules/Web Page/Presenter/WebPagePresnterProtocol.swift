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
}

// Interactor To Presenter
protocol WebPagePresenterInput: class {
    func changeFavouriteState(state: Bool)
}

//
protocol WebPageInteractorDelegate: class {
    func saveArticle()
}
