//
//  UIFonts+Extensions.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//
import UIKit


extension UIFont {
    
    //MARK: - boldItalic
    
    public class var boldItalic18: UIFont {
        UIFont.boldItalic(with: 18.0)
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

    public class var extraBoldItalic48: UIFont {
        UIFont.extraBoldItalic(with: 48.0)
    }
    
    // MARK: - Private helpers
    private enum FontStyle: String {
        case bold = "EBGaramond-Bold"
        case boldItalic = "EBGaramond-BoldItalic"
        case regular = "EBGaramond-Regular"
        case semibold = "EBGaramond-SemiBold"
        case semiboldItalic = "EBGaramond-SemiBoldItalic"
        case mediumItalic = "EBGaramond-MediumItalic"
        case medium = "EBGaramond-Medium"
        case extraBoldItalic = "EBGaramond-ExtraBoldItalic"
    }
    
    private static func boldItalic(with size: CGFloat) -> UIFont {
        self.font(with: .boldItalic, size: size)
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
