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
        static var profile: UIImage { UIImage(systemName: "person.crop.circle")! }
        static var categories: UIImage { UIImage(systemName: "list.dash")! }
    }
    
    // MARK: - Favourites
    public class var notLiked: UIImage {
        #imageLiteral(resourceName: "heartWhite")
    }
    
    public class var liked: UIImage {
        #imageLiteral(resourceName: "heartRed")
    }
}
