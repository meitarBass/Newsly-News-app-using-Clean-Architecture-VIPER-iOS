//
//  SourcesRouter.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

//Presenter to Sources
protocol SourcesRouterProtocol {
    var view: UIViewController? { get set }
}


class SourcesRouter: SourcesRouterProtocol {
    weak var view: UIViewController?
    
}
