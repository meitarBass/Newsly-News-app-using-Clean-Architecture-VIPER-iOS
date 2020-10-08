//
//  DiscoverViewController.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

class DiscoverViewController: BaseViewController {

    var presenter: DiscoverPresenterProtocol?
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var refreshController: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(userPulledView), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func userPulledView() {
        self.presenter?.viewDidLoad()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        presenter?.viewDidLoad()
    }
    
    override func setUpUI() {
        super.setUpUI()
        addSubViews()
        makeConstraints()
        
        // MARK: Uncomment the line below
        self.presenter?.collectionManager?.setUpCollectionView(collectionView: self.collectionView)
    }
    
    override func addSubViews() {
        super.addSubViews()
        self.view.addSubview(collectionView)
        collectionView.refreshControl = refreshController
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview().inset(15.0)
        }
    }

}


extension DiscoverViewController: DiscoverViewInput {
    func hideRefreshIndicator() {
        self.refreshController.endRefreshing()
    }
    
    
}
