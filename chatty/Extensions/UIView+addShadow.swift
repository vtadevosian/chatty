//
//  UIButton+addShadow.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/14/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(color: CGColor?, opacity: Float = 0.5, radius: CGFloat = 12, offset: CGSize? = nil) {
        self.layer.shadowColor = color ?? UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset ?? CGSize(width: 5, height: 10)
    }
}
