//
//  SearchRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

protocol SearchRouterProtocol {
    var view: UIViewController? { get set }
}

class SearchRouter: SearchRouterProtocol {    
    weak var view: UIViewController?
}
