//
//  UIBarButtonItem_XJExtension.swift
//  XJMissScarlett
//
//  Created by xj on 7/30/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    static func itemWith(imageName:String,highImageName:String,target:AnyObject,action:Selector) -> UIBarButtonItem {
        let button = UIButton(type: .Custom)
        button.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
        button.setBackgroundImage(UIImage(named: highImageName), forState: .Highlighted)
        button.size = button.currentBackgroundImage!.size
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        return UIBarButtonItem(customView: button)
        
    }
}


























