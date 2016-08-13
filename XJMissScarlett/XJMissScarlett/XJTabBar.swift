//
//  XJTabBar.swift
//  XJMissScarlett
//
//  Created by xj on 7/29/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTabBar: UITabBar {
    var publishView = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundImage = UIImage(named: "tabbar-light")
        publishView = UIButton(type: .Custom)
        publishView.setBackgroundImage(UIImage(named: "tabBar_publish_icon")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
        publishView.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Selected)
        publishView.size = (publishView.currentBackgroundImage?.size)!
        publishView.addTarget(self, action: #selector(self.publishClick), forControlEvents: .TouchUpInside)
        self.addSubview(publishView)
        
        
        
    }
    func publishClick() -> Void {
        let publish = XJPublishViewController()
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(publish, animated: false, completion: nil)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     override func layoutSubviews() {
        super.layoutSubviews()
        
        publishView.center = CGPointMake(self.width/2,self.height/2)
        let viewY = CGFloat(0)
        let viewW = self.width/5.0
        let viewH = self.height
        var index = CGFloat(0)
        for view in self.subviews {
            
            if !view.isKindOfClass(UIControl.classForCoder()) || view == self.publishView{
                continue
            }
            
            
               let viewX = viewW * ((index > 1) ? (index + 1):index)
                view.frame = CGRectMake(viewX, viewY, viewW, viewH)
                index += 1
            
        }
        
        
        
    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
    }
    

}




























