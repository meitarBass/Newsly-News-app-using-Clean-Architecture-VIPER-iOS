//
//  SearchBarManager.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

// Presenter to Manager
protocol searchControllerManagerProtocol {
    func setUpSearchController(searchController: UISearchController)
}

class SearchControllerManager: NSObject {
    var presenter: SearchPresenterProtocol?
    
    weak var delegate: SearchBarManagerDelegate?
    weak var searchController: UISearchController?
}

extension SearchControllerManager: searchControllerManagerProtocol {
    func setUpSearchController(searchController: UISearchController) {
        self.searchController = searchController
        self.searchController?.searchBar.delegate = self
    }
}

extension SearchControllerManager: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        if searchText.count > 0 {
            let textToSearch = searchText.replacingOccurrences(of: " ", with: "-")
            print(textToSearch)
            delegate?.searchClicked(name: textToSearch)
        }
    }
}
