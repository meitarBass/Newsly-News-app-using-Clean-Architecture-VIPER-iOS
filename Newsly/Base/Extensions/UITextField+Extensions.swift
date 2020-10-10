//
//  UITextField+Extensions.swift
//  Newsly
//
//  Created by Meitar Basson on 07/10/2020.
//

import UIKit

extension UITextField {
    
    func setUI(shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize, shadowColor: UIColor,
        placeHolderText: String, placeHolderColor: UIColor,
        padding: CGFloat,
        font: UIFont,
        backgroundColor: UIColor){
        
        self.addShadow(opacity: shadowOpacity, radius: shadowRadius, offset: shadowOffset, color: shadowColor)
        self.setPlaceHolderColor(placeholder: placeHolderText, color: placeHolderColor)
        self.setPadding(padding: padding)
        self.font = font
        self.backgroundColor = backgroundColor
    }
    
    func addShadow(opacity: Float, radius: CGFloat, offset: CGSize, color: UIColor) {
        borderStyle = .none
        clipsToBounds = false
        
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.masksToBounds = false
    }
    
    func setPlaceHolderColor(placeholder: String, color: UIColor) {
        attributedPlaceholder =
            NSAttributedString(string: placeholder,
                            attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    func setPadding(padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0
                                ,width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
