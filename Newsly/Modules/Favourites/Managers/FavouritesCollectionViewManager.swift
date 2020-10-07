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
        let titleFont: UIFont = .extraBold28
        let descriptionFont: UIFont = .semiboldItalic16
    }
}

// Presenter to Manager
protocol FavouritesCollectionViewManagerProtocol {
    func setUpCollectionView(collectionView: UICollectionView)
    func setUpCells(articles: [Article])
}


class FavouritesCollectionViewManager: NSObject {
    
    weak var delegate: FavouritesCollectionViewManagerDelegate?
    weak var collectionView: UICollectionView?
    
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
    
    private func getDescriptionHeight(at row: Int) -> CGFloat {
        guard
            let description = articles?[row].description,
            let collectionView = collectionView else { return CGFloat.zero }
        
        let maxMessageSize = CGSize(width: collectionView.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let descriptionSize = NSString(string: description)
            .boundingRect(with: maxMessageSize, options: options, attributes: [NSAttributedString.Key.font : self.appearance.descriptionFont], context: nil)
        
        return descriptionSize.height
    }
    
}

extension FavouritesCollectionViewManager: FavouritesCollectionViewManagerProtocol {
    func setUpCollectionView(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        self.collectionView?.contentInset = UIEdgeInsets(top: appearance.collectionViewInsets, left: appearance.collectionViewInsets, bottom: appearance.collectionViewInsets, right: appearance.collectionViewInsets)
        
    }
    
    func setUpCells(articles: [Article]) {
        self.articles = articles
        collectionView?.reloadData()
    }
}

extension FavouritesCollectionViewManager: UICollectionViewDelegate { }

extension FavouritesCollectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        let cellViewModel = SearchCellViewModel(article: articles?[indexPath.row], titleHeight: getTitleHeight(at: indexPath.row
        ), descriptionHeight: getDescriptionHeight(at: indexPath.row))
        cell.viewModel = cellViewModel
        return cell
    }
    
    
}

extension FavouritesCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.getCellSize(at: indexPath.row)
    }
}
