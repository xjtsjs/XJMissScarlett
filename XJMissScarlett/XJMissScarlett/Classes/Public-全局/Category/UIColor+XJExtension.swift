//
//  UIColor+XJExtension.swift
//  XJMissScarlett
//
//  Created by xj on 7/30/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

extension UIColor{
    static func XJ_rgbColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
    }
    static func XJ_globalBg() -> UIColor {
        return self.XJ_rgbColor(223, g: 223, b: 223, a: 1.0)
    }
}
