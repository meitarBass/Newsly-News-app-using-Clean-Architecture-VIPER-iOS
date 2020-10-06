//
//  SearchBarManager.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

// Presenter to Manager
protocol SearchSearchBarManagerProtocol {
    func setUpSearchBar(searchBar: UISearchBar)
}

class SearchBarManager: NSObject {
    var presenter: SearchPresenterProtocol?
    
    weak var delegate: SearchBarManagerDelegate?
    weak var searchBar: UISearchBar?
}

extension SearchBarManager: SearchSearchBarManagerProtocol {
    func setUpSearchBar(searchBar: UISearchBar) {
        self.searchBar = searchBar
        self.searchBar?.delegate = self
    }
}

extension SearchBarManager: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        if searchText.count > 0 {
            let textToSearch = searchText.replacingOccurrences(of: " ", with: "%20")
            print(textToSearch)
            delegate?.searchClicked(name: textToSearch)
//            presenter?.searchForArticles(by: textToSearch)
        }
    }
}
