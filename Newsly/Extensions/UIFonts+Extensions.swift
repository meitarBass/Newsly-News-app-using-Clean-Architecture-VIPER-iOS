//
//  UIFonts+Extensions.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//
import UIKit


extension UIFont {
    
    
    
    // MARK: - Regular
    public class var regular9: UIFont {
        UIFont.regular(with: 9.0)
    }
    
    public class var regular10: UIFont {
        UIFont.regular(with: 10.0)
    }
    
    public class var regular11: UIFont {
        UIFont.regular(with: 11.0)
    }
    
    public class var regular12: UIFont {
        UIFont.regular(with: 12.0)
    }
    
    public class var regular13: UIFont {
        UIFont.regular(with: 13.0)
    }
    
    public class var regular14: UIFont {
        UIFont.regular(with: 14.0)
    }
    
    public class var regular15: UIFont {
        UIFont.regular(with: 15.0)
    }
    
    public class var regular16: UIFont {
        UIFont.regular(with: 16.0)
    }
    
    public class var regular17: UIFont {
        UIFont.regular(with: 17.0)
    }
    
    public class var regular18: UIFont {
        UIFont.regular(with: 18.0)
    }
    
    public class var regular20: UIFont {
        UIFont.regular(with: 20.0)
    }
    
    public class var regular22: UIFont {
        UIFont.regular(with: 22.0)
    }
    
    public class var regular25: UIFont {
        UIFont.regular(with: 25.0)
    }
    
    public class var regular28: UIFont {
        UIFont.regular(with: 28.0)
    }
    
    public class var regular30: UIFont {
        UIFont.regular(with: 30.0)
    }
    
    public class var regular37: UIFont {
        UIFont.regular(with: 37.0)
    }
    
    // MARK: - Bold
    public class var bold9: UIFont {
        UIFont.bold(with: 9.0)
    }
    
    public class var bold11: UIFont {
        UIFont.bold(with: 11)
    }
    
    public class var bold16: UIFont {
        UIFont.bold(with: 16.0)
    }
    
    public class var bold18: UIFont {
        UIFont.bold(with: 18.0)
    }
    
    public class var bold22: UIFont {
        UIFont.bold(with: 22.0)
    }
    
    public class var bold23: UIFont {
        UIFont.bold(with: 23.0)
    }
    
    public class var boldItalic11: UIFont {
        UIFont.boldItalic(with: 11)
    }
    
    public class var boldItalic16: UIFont {
        UIFont.boldItalic(with: 16.0)
    }
    
    public class var boldItalic18: UIFont {
        UIFont.boldItalic(with: 18.0)
    }
    
    
    // MARK: - Black
    public class var black16: UIFont {
        UIFont.black(with: 16.0)
    }
    
    // MARK: - Semibold
    
    public class var semibold15: UIFont {
        UIFont.semibold(with: 15.0)
    }
    
    public class var semibold17: UIFont {
        UIFont.semibold(with: 17.0)
    }
    
    //MARK: - semiBoldItalic
    
    public class var semiboldItalic13: UIFont {
        UIFont.semiboldItalic(with: 13.0)
    }
    
    public class var semiboldItalic15: UIFont {
        UIFont.semiboldItalic(with: 15.0)
    }
    
    public class var semiboldItalic17: UIFont {
        UIFont.semiboldItalic(with: 17.0)
    }
    
    // MARK: - Private helpers
    private enum FontStyle: String {
        case black = "EBGaramond-Black"
        case blackItalic = "EBGaramond-BlackItalic"
        case bold = "EBGaramond-Bold"
        case boldItalic = "EBGaramond-BoldItalic"
        case regular = "EBGaramond-Regular"
        case semibold = "EBGaramond-SemiBold"
        case semiboldItalic = "EBGaramond-SemiBoldItalic"
    }

    private static func black(with size: CGFloat) -> UIFont {
        self.font(with: .black, size: size)
    }
    
    private static func blackItalic(with size: CGFloat) -> UIFont {
        self.font(with: .blackItalic, size: size)
    }
    
    private static func bold(with size: CGFloat) -> UIFont {
        self.font(with: .bold, size: size)
    }
    
    private static func boldItalic(with size: CGFloat) -> UIFont {
        self.font(with: .boldItalic, size: size)
    }
    
    private static func regular(with size: CGFloat) -> UIFont {
        self.font(with: .regular, size: size)
    }
    
    private static func semibold(with size: CGFloat) -> UIFont {
        self.font(with: .semibold, size: size)
    }
    
    private static func semiboldItalic(with size: CGFloat) -> UIFont {
        self.font(with: .semiboldItalic, size: size)
    }
    
    private static func font(with style: FontStyle, size: CGFloat) -> UIFont {
        UIFont(name: style.rawValue, size: size)!
    }
    
    
    
}
