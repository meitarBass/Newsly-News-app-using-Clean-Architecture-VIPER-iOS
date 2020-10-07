//
//  FavouritesRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

protocol FavouritesRouterProtocol {
    var view: UIViewController? { get set }
}

class FavouritesRouter: FavouritesRouterProtocol {
    weak var view: UIViewController?
}
