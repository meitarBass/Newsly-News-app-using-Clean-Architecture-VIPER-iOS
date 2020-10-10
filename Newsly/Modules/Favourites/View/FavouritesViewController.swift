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
    //TODO: -  fix scroll view
    var presenter: FavouritesPresenterProtocol?
    let appearance = Appearance()
    var userImage: UIImage?
    
    private lazy var profileView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var collectionView: UICollectionView = {
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
        searchBar.placeholder = "Search..."
        return searchBar
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = appearance.labelFont
        label.textColor = appearance.labelColor
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = appearance.labelFont
        label.textColor = appearance.labelColor
        return label
    }()
    
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .cyan
        imageView.layer.cornerRadius = appearance.imageHeight / 2
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.image = UIImage.tabBarItems.categories
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoutButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        return barButton
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
        self.presenter?.viewDidAppear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainScrollView.contentSize = collectionView.contentSize
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
    
    override func setUpUI() {
        super.setUpUI()
        self.addKeyBoardObserver()
        addSubViews()
        makeConstraints()
        
        self.presenter?.collectionManager?.setUpCollectionView(collectionView: self.collectionView)
        self.presenter?.searchBarManager?.setUpSearchBar(searchBar: self.searchBar)
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(mainScrollView)
        mainScrollView.addSubview(profileView)
                
        self.profileView.addSubview(profileImage)
        self.profileView.addSubview(labelStack)
        self.profileView.addSubview(searchBar)
        self.profileView.addSubview(collectionView)
        
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        mainScrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        profileView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view)
            make.centerX.equalTo(self.view)
            make.leading.trailing.equalTo(self.view)
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainScrollView.safeAreaLayoutGuide.snp.topMargin).inset(16.0)
            make.leading.equalTo(16.0)
            make.height.width.equalTo(appearance.imageHeight)
        }
        
        labelStack.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImage.snp.centerY)
            make.trailing.greaterThanOrEqualTo(16.0)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(16.0)
            make.leading.trailing.bottom.equalToSuperview().inset(16.0)
        }
        
    }
    
    @objc private func profileImageTapped() {
        presenter?.addPhotoTapped()
    }
    
    @objc private func logoutButtonTapped() {
        presentAlert(title: "Sign Out", message: "Are you sure you want to sign out?", action: ActionAlertModel(actionText: "Cancel", actionHandler: {}), action2: ActionAlertModel(actionText: "Ok", actionHandler: {
            self.presenter?.signOut()
        }))
        
    }
}

extension FavouritesViewController: FavouritesViewInput {
    func updateImage(Image: UIImage?) {
        profileImage.image = Image
    }
    
    func collectionViewWasUpdated() {
        mainScrollView.contentSize = collectionView.contentSize
    }
    
    func updateUserInfo(name: String?, email: String?) {
        emailLabel.text = email
        nameLabel.text = name
    }
    
    
}
