//
//  DiscoverCollectionViewManager.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

extension DiscoverCollectionViewManager {
    struct Appearance {
        let imageHeight: CGFloat = 250.0
        let insets: CGFloat = 10.0
        let titleFont: UIFont = UIFont.extraBold28
        let descriptionFont: UIFont = UIFont.medium14
    }
}

//presenter to manager
protocol DiscoverCollectionViewManagerProtocol {
    func setUpCollectionView(collectionView: UICollectionView)
    func setupChats(articles: [Article])
}




class DiscoverCollectionViewManager: NSObject {
    weak var delegate: DiscoverCollectionViewManagerDelegate?
    weak var collectionView: UICollectionView?
    
    private var articles: [Article]?
    private let appearance = Appearance()
    
    
    private func getCellSize(at row: Int) -> CGSize {
        guard
            let collectionView = collectionView else { return CGSize.zero }
        
        let titleHeight = getTitleHeight(at: row)
        let descriptionHeight = getDescriptionHeight(at: row)
        
        return CGSize(width: collectionView.frame.size.width,
                      height: titleHeight + descriptionHeight + self.appearance.imageHeight)
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


extension DiscoverCollectionViewManager: DiscoverCollectionViewManagerProtocol {
    func setupChats(articles: [Article]) {
        self.articles = articles
        self.collectionView?.reloadData()
    }
    
    func setUpCollectionView(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(TopHeadlinesCollectionViewCell.self, forCellWithReuseIdentifier: TopHeadlinesCollectionViewCell.reuseIdentifier)
    }
    
    
}

extension DiscoverCollectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHeadlinesCollectionViewCell.reuseIdentifier, for: indexPath) as? TopHeadlinesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cellViewModel = HeadlinesCellViewModel(article: articles?[indexPath.row],
                                                   titleHeight: getTitleHeight(at: indexPath.row),
                                                   descriptionHeight: getDescriptionHeight(at: indexPath.row))
        cell.viewModel = cellViewModel
        return cell
    }
}


extension DiscoverCollectionViewManager: UICollectionViewDelegate {}

extension DiscoverCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.getCellSize(at: indexPath.row)
    }
}
