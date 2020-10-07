//
//  UIColors+Extensions.swift
//  Newsly
//
//  Created by Meitar Basson on 06/10/2020.
//

import UIKit

extension UIColor {
    
    // MARK: - Regular
    public class var background: UIColor {
        #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
    }
    
    public class var textColorBlack: UIColor {
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    // DescriptionLabels,
    public class var textColorGray: UIColor {
        #colorLiteral(red: 0.4117647059, green: 0.4117647059, blue: 0.4117647059, alpha: 1)
    }
    
    // MARK: Tab Bar Items Tint Color
    
    public class var tintColor: UIColor {
        #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    // MARK: - Cells Background
    
    public class var darkBackground: UIColor {
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    // MARK: - Placeholder
    public class var placeHolderTextColor: UIColor {
        #colorLiteral(red: 0.6941176471, green: 0.6823529412, blue: 0.6823529412, alpha: 1)
    }
    
    public class var placeHolderBackgroundColor: UIColor {
        #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
    }
}
