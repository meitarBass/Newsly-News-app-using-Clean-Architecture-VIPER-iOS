//
//  UIImages+Extensions.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import UIKit

extension UIImage {
    
    enum tabBarItems {
        static var discover: UIImage { UIImage(systemName: "globe")! }
        static var source: UIImage { UIImage(systemName: "folder")! }
        static var search: UIImage { UIImage(systemName: "magnifyingglass")! }
        static var favourite: UIImage { UIImage(systemName: "star")! }
        static var categories: UIImage { UIImage(systemName: "list.dash")! }
    }
}
