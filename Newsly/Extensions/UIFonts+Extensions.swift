//
//  UIFonts+Extensions.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//
import UIKit


extension UIFont {
    
    //MARK: - boldItalic
    
    // DiscoverTitles, SearchTitles, FavouritesTitles, CategoriesTableCell, SourcesTableCell
    public class var extraBold28: UIFont {
        UIFont.extraBold(with: 28.0)
    }

    //MARK: - semiBoldItalic
    
    public class var semiboldItalic16: UIFont {
        UIFont.semiboldItalic(with: 16.0)
    }
    
    public class var semiboldItalic22: UIFont {
        UIFont.semiboldItalic(with: 22.0)
    }
    
    //MARK: - medium
    public class var medium14: UIFont {
        UIFont.medium(with: 14.0)
    }
    
    //MARK: - mediumItalic

    public class var mediumItalic32: UIFont {
        UIFont.mediumItalic(with: 32.0)
    }
    
    //MARK: - extraBoldItalic

    // TabBarTitles
    public class var extraBoldItalic28: UIFont {
        UIFont.extraBoldItalic(with: 28.0)
    }

    public class var extraBoldItalic48: UIFont {
        UIFont.extraBoldItalic(with: 48.0)
    }
    
    // MARK: - Private helpers
    private enum FontStyle: String {
        case regular = "EBGaramond-Regular"
        
        case medium = "EBGaramond-Medium"
        case mediumItalic = "EBGaramond-MediumItalic"
        
        case semibold = "EBGaramond-SemiBold"
        case semiboldItalic = "EBGaramond-SemiBoldItalic"
        
        case bold = "EBGaramond-Bold"
        case boldItalic = "EBGaramond-BoldItalic"
        
        case extraBold = "EBGaramond-ExtraBold"
        case extraBoldItalic = "EBGaramond-ExtraBoldItalic"
    }
    
    private static func extraBold(with size: CGFloat) -> UIFont {
        self.font(with: .extraBold, size: size)
    }
    
    private static func semiboldItalic(with size: CGFloat) -> UIFont {
        self.font(with: .semiboldItalic, size: size)
    }
    
    private static func medium(with size: CGFloat) -> UIFont {
        self.font(with: .medium, size: size)
    }
    
    private static func mediumItalic(with size: CGFloat) -> UIFont {
        self.font(with: .mediumItalic, size: size)
    }
    
    private static func extraBoldItalic(with size: CGFloat) -> UIFont {
        self.font(with: .extraBoldItalic, size: size)
    }
    
    private static func font(with style: FontStyle, size: CGFloat) -> UIFont {
        UIFont(name: style.rawValue, size: size)!
    }
    
}
