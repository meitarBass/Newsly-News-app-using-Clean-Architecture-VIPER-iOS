//
//  FavouritesCollectionViewManager.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

extension FavouritesCollectionViewManager {
    struct Appearance {
        let imageHeight: CGFloat = 250.0
        let collectionViewInsets: CGFloat = 0.0
        let favouriteFont: UIFont = .extraBold28
        let titleFont: UIFont = .bold16
    }
}

// Presenter to Manager
protocol FavouritesCollectionViewManagerProtocol {
    func setUpCollectionView(collectionView: UICollectionView)
    func setUpCells(articles: [Article])
    func imageGotten(image: UIImage?)
    func updateUserInfo(name: String?, email: String?)
}


class FavouritesCollectionViewManager: NSObject {
    
    weak var delegate: FavouritesCollectionViewManagerDelegate?
    weak var collectionView: UICollectionView?
    var profileInfoCellManager: ProfileInfoCollectionViewCellProtocol?
    
    let appearance = Appearance()
    var articles: [Article]?
    
    private func getCellSize(at row: Int) -> CGSize {
        guard let collectionView = collectionView else { return CGSize.zero }
        return CGSize(width: collectionView.frame.size.width,
                      height: self.appearance.imageHeight)
    }
    
    private func getTitleHeight(at row: Int) -> CGFloat {
        guard
            let title = articles?[row].title,
            let collectionView = collectionView else { return CGFloat.zero }
        
        let maxMessageSize = CGSize(width: collectionView.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let titleSize = NSString(string: title)
            .boundingRect(with: maxMessageSize, options: options, attributes: [NSAttributedString.Key.font : self.appearance.titleFont], context: nil)
        
        return titleSize.height
    }
    
    private func getSourceHeight(at row: Int) -> CGFloat {
        guard
            let source = articles?[row].source.name,
            let collectionView = collectionView else { return CGFloat.zero }
        
        let maxMessageSize = CGSize(width: collectionView.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let sourceSize = NSString(string: source)
            .boundingRect(with: maxMessageSize, options: options, attributes: [NSAttributedString.Key.font : self.appearance.favouriteFont], context: nil)
        
        return sourceSize.height
    }
    
    private func getProfileInfoCellHeight() -> CGFloat {
        ProfileInfoCollectionViewCell.Appearance.searchBarHeight + ProfileInfoCollectionViewCell.Appearance.imageHeight + ProfileInfoCollectionViewCell.Appearance.imageTopMarging + ProfileInfoCollectionViewCell.Appearance.searchBarTopMargin + 20.0
    }
    
}

extension FavouritesCollectionViewManager: FavouritesCollectionViewManagerProtocol {
  
    func setUpCollectionView(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        self.collectionView?.register(ProfileInfoCollectionViewCell.self, forCellWithReuseIdentifier: ProfileInfoCollectionViewCell.reuseIdentifier)
        self.collectionView?.contentInset = UIEdgeInsets(top: appearance.collectionViewInsets, left: appearance.collectionViewInsets, bottom: appearance.collectionViewInsets, right: appearance.collectionViewInsets)
        
    }
    
    func setUpCells(articles: [Article]) {
        self.articles = articles
        UIView.setAnimationsEnabled(false)
        collectionView?.performBatchUpdates {
            collectionView?.reloadSections(IndexSet(integer: 1))
        } completion: { (_) in
            UIView.setAnimationsEnabled(true)
        }
    }
    
    func imageGotten(image: UIImage?) {
        profileInfoCellManager?.updateImage(Image: image)
    }
    
    func updateUserInfo(name: String?, email: String?) {
        profileInfoCellManager?.updateUserInfo(name: name, email: email)
    }
    
}

extension FavouritesCollectionViewManager: UICollectionViewDelegate { }

extension FavouritesCollectionViewManager: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return articles?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileInfoCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfileInfoCollectionViewCell else { return UICollectionViewCell() }
            self.profileInfoCellManager = cell
            cell.delegate = self
            cell.setupSearchbar()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
            let cellViewModel = SearchCellViewModel(article: articles?[indexPath.row], sourceHeight: getSourceHeight(at: indexPath.row), titleHeight: getTitleHeight(at: indexPath.row))
            cell.viewModel = cellViewModel
            return cell
        }
        
    }
    
    
}

extension FavouritesCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.size.width, height: getProfileInfoCellHeight() )
        } else {
            return self.getCellSize(at: indexPath.row)
        }
    }
}


extension FavouritesCollectionViewManager: ProfileInfoCollectionViewCellDelegate {
    func addPhotoTapped() {
        delegate?.addPhotoTapped()
    }
}
