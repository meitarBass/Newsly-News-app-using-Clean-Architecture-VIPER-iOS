//
//  SourcesPresenterProtocols.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

// View To Presenter
protocol SourcesPresenterProtocol: class {
    func viewDidLoad()
    var tableViewManager: SourcesTableViewManagerProtocol? { get set }
}

//Interactor To Presenter
protocol SourcesPresenterInput: class {
    func apiFetchSuccess(sources: [Sources])
    func handleError(error: Error)
}


//Manager To Presenter
protocol SourcesTableViewManagerDelegate: class {
    
}
