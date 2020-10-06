//
//  SourcesPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import Foundation

class SourcesPresenter {
    
    weak var view: SourcesViewInput?
    var interactor: SourcesInteractorInput?
    var router: SourcesRouterProtocol?
    var tableViewManager: SourcesTableViewManagerProtocol?
    
}

//MARK: - SourcesPresenterProtocol
extension SourcesPresenter: SourcesPresenterProtocol {
    func viewDidLoad() {
        interactor?.fetchTrendingSources()
    }
    
}

//MARK: - SourcesPresenterInput
extension SourcesPresenter: SourcesPresenterInput {
    func apiFetchSuccess(sources: [Sources]) {
        self.tableViewManager?.setUpCells(sources: sources)
    }
    
    func handleError(error: Error) {
        self.view?.presentAlert(title: "Error", message: error.localizedDescription, action: nil)
    }
    
    
}


//MARK: - SourcesCollectionViewManagerDelegate
extension SourcesPresenter: SourcesTableViewManagerDelegate {
    
}
