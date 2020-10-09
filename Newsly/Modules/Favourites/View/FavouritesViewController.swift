//
//  FavouritesViewController.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit
import SnapKit

extension FavouritesViewController {
    struct Appearance {
        let searchBarConstraint: CGFloat = 16.0
    }
}

class FavouritesViewController: BaseViewController {
    
    var presenter: FavouritesPresenterProtocol?
    let appearance = Appearance()
    
    var favouriteArticles: [Article]?
    var userImage: UIImage?
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.font: UIFont.semiboldItalic16]
        
        navigationItem.searchController = searchController
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        // MARK: Move this to the presenter
        self.favouriteArticles = presenter?.loadFavouriteArticles()
        self.userImage = presenter?.loadProfileImage()
    }
    
    override func setUpUI() {
        super.setUpUI()
        addSubViews()
        makeConstraints()
        
        self.presenter?.collectionManager?.setUpCollectionView(collectionView: self.collectionView)
        self.presenter?.searchControllerManager?.setUpSearchController(searchController: self.searchController)
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(collectionView)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).inset(15)
            make.leading.trailing.bottom.equalToSuperview().inset(15.0)
        }
    }
}

extension FavouritesViewController: FavouritesViewInput {
    
}
