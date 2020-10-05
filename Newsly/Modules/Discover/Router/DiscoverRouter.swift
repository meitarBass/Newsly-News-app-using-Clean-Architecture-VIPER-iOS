//
//  DiscoverRouter.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

//presenter to router
protocol DiscoverRouterProtocol {
    var view: UIViewController? { get set }
}


class DiscoverRouter: DiscoverRouterProtocol {
    weak var view: UIViewController?
    
}
