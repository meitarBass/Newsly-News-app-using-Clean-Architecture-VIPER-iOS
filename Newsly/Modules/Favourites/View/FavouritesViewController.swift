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
        let labelFont: UIFont = .semiboldItalic22
        let labelColor: UIColor = .textColorBlack
        
        let imageHeight: CGFloat = 100.0
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
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.font: UIFont.semiboldItalic16]
        searchBar.barTintColor = .background
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = appearance.labelFont
        label.textColor = appearance.labelColor
        label.text = "Ebi"
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = appearance.labelFont
        label.textColor = appearance.labelColor
        label.text = "Something@random.com"
        return label
    }()
    
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .cyan
        imageView.layer.cornerRadius = appearance.imageHeight / 2
        return imageView
    }()
    
    private lazy var labelStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        return stackView
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
        self.presenter?.searchBarManager?.setUpSearchBar(searchBar: self.searchBar)
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(collectionView)
        self.view.addSubview(profileImage)
        self.view.addSubview(labelStack)
        self.view.addSubview(searchBar)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(16.0)
            make.leading.trailing.bottom.equalToSuperview().inset(16.0)
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).inset(16.0)
            make.leading.equalTo(16.0)
            make.height.width.equalTo(appearance.imageHeight)
        }
        
        labelStack.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImage.snp.centerY)
            make.trailing.greaterThanOrEqualTo(16.0)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        
    }
}

extension FavouritesViewController: FavouritesViewInput {
    
}
