//
//  FavouritesPresenter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

class FavouritesPresenter {
    
    weak var view: FavouritesViewInput?
    var interactor: FavouritesInteractorInput?
    var searchBarDelegate: FavouritesSearchBarManagerDelegate?
    var searchBarManager: FavouritesSearchBarManagerProtocol?
    var collectionManager: FavouritesCollectionViewManagerProtocol?
    
    var router: FavouritesRouter?
    var articles: [Article]?
}

extension FavouritesPresenter: FavouritesPresenterInput {
    func ApiFetchSuccess(articles: [Article]) {
        view?.hideActivityIndicator()
        self.collectionManager?.setUpCells(articles: articles)
    }
    
    func handleError(error: Error) {
        view?.hideActivityIndicator()
        self.view?.presentAlert(title: "error", message: error.localizedDescription, action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
    }
}

extension FavouritesPresenter: FavouritesPresenterProtocol {

    
    func viewDidAppear() {
        let userInfo = interactor?.getUserInfo()
        view?.updateUserInfo(name: userInfo?.name, email: userInfo?.email)
            
        interactor?.loadFavouriteArticles(completion: {[weak self] articles in
            if let articles = articles {
                self?.articles = articles
                self?.collectionManager?.setUpCells(articles: articles)
            } else {
                self?.view?.presentAlert(title: "", message: "Error occured", action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
            }
        })
        
        interactor?.loadProfileImage(completion: { [weak self] image in
            self?.view?.updateImage(Image: image)
        })
        
        
    }
    
    func addPhotoTapped() {
        self.router?.routeToImagePicker(delegate: self)
    }
    
    func signOut() {
        self.interactor?.signOut()
    }
    
}

extension FavouritesPresenter: FavouritesCollectionViewManagerDelegate {
    func cellClicked(article: Article?) {
        self.router?.createWebView(article: article)
    }
    
    
}

extension FavouritesPresenter: FavouritesSearchBarManagerDelegate {
    func queryArticles(name: String) {
        guard let articles = articles else { return }
        if name.count == 0 {
            self.collectionManager?.setUpCells(articles: articles)
        } else {
            var queriedArticles = [Article]()
            for article in articles {
                if (article.title?.lowercased().contains(name.lowercased()) ?? false) ||
                    (article.source.name?.lowercased().contains(name.lowercased()) ?? false) {
                        queriedArticles.append(article)
                }
            }
            self.collectionManager?.setUpCells(articles: queriedArticles)
        }
    }
}

extension FavouritesPresenter: ImagePickerManagerDelegate {
    func imageGotten(image: UIImage) {
        interactor?.saveImageToDataBase(image: image, completion: {[weak self] in
            self?.view?.updateImage(Image: image)
        })
    }
}
