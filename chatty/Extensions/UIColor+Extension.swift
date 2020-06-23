//
//  UIColor+Extension.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/15/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

extension UIColor {
    typealias brandColors = K.BrandColors
    
    static var bgColor1: UIColor {
        return UIColor(named: brandColors.bgColor1) ?? .black
    }
    
    static var bgColor2: UIColor {
        return UIColor(named: brandColors.bgColor2) ?? .black
    }

    static var bgColor3: UIColor {
        return UIColor(named: brandColors.bgColor3) ?? .black
    }
    
    static var bgColor4: UIColor {
        return UIColor(named: brandColors.bgColor4) ?? .black
    }
    
    static var tintColor1: UIColor {
        return UIColor(named: brandColors.tintColor1) ?? .black
    }
    
    static var tintColor2: UIColor {
        return UIColor(named: brandColors.tintColor2) ?? .black
    }
    
    static var tintColor3: UIColor {
        return UIColor(named: brandColors.tintColor3) ?? .black
    }
    
    static var tintColor4: UIColor {
        return UIColor(named: brandColors.tintColor4) ?? .black
    }
    
    static var tintColor5: UIColor {
        return UIColor(named: brandColors.tintColor5) ?? .black
    }
    
    static var shadowColor: UIColor {
        return UIColor(named: brandColors.shadowColor) ?? .black
    }
}


