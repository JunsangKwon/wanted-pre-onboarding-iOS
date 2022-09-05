//
//  UIFont+Extension.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/05.
//

import UIKit.UIFont

extension UIFont {
    
    static let bigFont: UIFont = {
        return UIFont.systemFont(ofSize: 45, weight: .light)
    }()
    
    static let titleBoldFont: UIFont = {
        return UIFont.systemFont(ofSize: 25, weight: .bold)
    }()
    
    static let titleFont: UIFont = {
        return UIFont.systemFont(ofSize: 25, weight: .light)
    }()
    
    static let mediumFont: UIFont = {
        return UIFont.systemFont(ofSize: 20, weight: .light)
    }()
    
    static let normalBoldFont: UIFont = {
        return UIFont.systemFont(ofSize: 17, weight: .bold)
    }()
    
    static let normalFont: UIFont = {
        return UIFont.systemFont(ofSize: 17, weight: .light)
    }()
    
    static let smallBoldFont: UIFont = {
        return UIFont.systemFont(ofSize: 15, weight: .semibold)
    }()
    
    static let smallFont: UIFont = {
        return UIFont.systemFont(ofSize: 14, weight: .light)
    }()
}
