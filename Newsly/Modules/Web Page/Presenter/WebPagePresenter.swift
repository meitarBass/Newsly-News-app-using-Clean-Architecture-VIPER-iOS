//
//  WebPagePresenter.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 08.10.2020.
//

import Foundation

class WebPagePresenter {
    
    weak var view: WebPageViewInput?
    var urlString: String?
}

extension WebPagePresenter: WebPagePresenterProtocol {
    func viewDidLoad() {
        guard let urlString = self.urlString else { return }
        self.view?.showWebPage(url: urlString)
    }
}

extension WebPagePresenter: WebPagePresenterInput {
    
}

extension WebPagePresenter: WebPageTextFieldsManagerDelegate {
    
}
