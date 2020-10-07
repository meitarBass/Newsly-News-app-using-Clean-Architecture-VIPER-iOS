//
//  FavouritesTabBarManager.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

// Presenter to Manager
protocol FavouritesSearchBarManagerProtocol {
    func setUpSearchBar(searchBar: UISearchBar)
}

class FavouritesSearchBarManager: NSObject {
    var presenter: FavouritesPresenterProtocol?
    
    weak var delegate: FavouritesSearchBarManagerDelegate?
    weak var searchBar: UISearchBar?
}

extension FavouritesSearchBarManager: FavouritesSearchBarManagerProtocol {
    func setUpSearchBar(searchBar: UISearchBar) {
        self.searchBar = searchBar
        self.searchBar?.delegate = self
    }
}

extension FavouritesSearchBarManager: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        if searchText.count > 0 {
            let textToSearch = searchText.replacingOccurrences(of: " ", with: "-")
            print(textToSearch)
            delegate?.searchBarClicked(name: textToSearch)
        }
    }
}

