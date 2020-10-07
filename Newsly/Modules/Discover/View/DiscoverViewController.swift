//
//  DiscoverViewController.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

class DiscoverViewController: BaseViewController {

    var presenter: DiscoverPresenterProtocol?
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
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
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}


extension DiscoverViewController: DiscoverViewInput {
    
}
