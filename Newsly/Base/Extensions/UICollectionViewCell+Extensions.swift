//
//  UICollectionViewCell+Extensions.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 06.10.2020.
//

import UIKit

extension UICollectionViewCell {
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
