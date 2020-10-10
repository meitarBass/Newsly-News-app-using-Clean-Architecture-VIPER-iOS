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
//    var articles: [Article]?
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
                self?.collectionManager?.setUpCells(articles: articles)
            } else {
                self?.view?.presentAlert(title: "", message: "Error occured", action: ActionAlertModel(actionText: "Ok", actionHandler: {}))
            }
        })
        
        interactor?.loadProfileImage(completion: { [weak self] image in
            self?.view?.updateImage(Image: image)
        })
        
        
    }
    
    func searchForArticles(by name: String) {
        // TODO: Set the collection View Manager
       
    }
    
    func addPhotoTapped() {
        self.router?.routeToImagePicker(delegate: self)
    }
    
    func signOut() {
        self.interactor?.signOut()
    }
    
}

extension FavouritesPresenter: FavouritesCollectionViewManagerDelegate {
    
}

extension FavouritesPresenter: FavouritesSearchBarManagerDelegate {
    func searchBarClicked(name: String) {
//        interactor?.fetchFavouritesArticles()
    }
}

extension FavouritesPresenter: ImagePickerManagerDelegate {
    func imageGotten(image: UIImage) {
        interactor?.saveImageToDataBase(image: image, completion: {[weak self] in
            self?.view?.updateImage(Image: image)
        })
    }
}
