//
//  UIButton+roundCorners.swift
//  chatty
//
//  Created by Vahram Tadevosian on 6/14/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(cornerRadius: CGFloat? = nil, borderWidth: CGFloat = 1.0, borderColor: CGColor? = nil) {
        self.layer.cornerRadius = cornerRadius ?? self.frame.size.height / 4
        self.layer.masksToBounds = false
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor ?? UIColor.clear.cgColor
    }
}
