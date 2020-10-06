//
//  DiscoverPresenterProtocols.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

// view to presenter
protocol DiscoverPresenterProtocol: class {
    func viewDidLoad()
    var collectionManager: DiscoverCollectionViewManagerProtocol? { get set }
    
}

//interactor to presenter
protocol DiscoverPresenterInput: class {
    func apiFetchSuccess(articles: [Article])
    func handleError(error: Error)
}


//manager to presenter
protocol DiscoverCollectionViewManagerDelegate: class {
    
}
