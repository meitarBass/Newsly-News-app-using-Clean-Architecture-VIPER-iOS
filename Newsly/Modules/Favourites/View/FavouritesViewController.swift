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
    var userImage: UIImage?

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private lazy var logoutButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        self.presenter?.viewDidAppear()
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

    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(collectionView)
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(16.0)
            make.leading.trailing.bottom.equalToSuperview().inset(16.0)
        }
        
    }
    @objc private func logoutButtonTapped() {
        presentAlert(title: "Sign Out", message: "Are you sure you want to sign out?", action: ActionAlertModel(actionText: "Cancel", actionHandler: {}), action2: ActionAlertModel(actionText: "Ok", actionHandler: {
            self.presenter?.signOut()
        }))
        
    }
}

extension FavouritesViewController: FavouritesViewInput {
    
    
}
