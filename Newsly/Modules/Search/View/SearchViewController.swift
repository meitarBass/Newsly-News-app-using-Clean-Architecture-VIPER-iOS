//
//  SearchViewController.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit
import SnapKit

extension SearchViewController {
    struct Appearance {
        let searchBarConstraint: CGFloat = 16.0
    }
}

class SearchViewController: BaseViewController {
    
    var presenter: SearchPresenterProtocol?
    let appearance = Appearance()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        // TODO: Set Font
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func setUpUI() {
        super.setUpUI()
        addSubViews()
        makeConstraints()
        self.presenter?.collectionManager?.setUpCollectionView(collectionView: self.collectionView)
        self.presenter?.searchBarManager?.setUpSearchBar(searchBar: self.searchBar)
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(collectionView)
        self.view.addSubview(searchBar)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalTo(appearance.searchBarConstraint)
            make.trailing.equalTo(-appearance.searchBarConstraint)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottomMargin)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
}

extension SearchViewController: SearchViewInput {
    
}
