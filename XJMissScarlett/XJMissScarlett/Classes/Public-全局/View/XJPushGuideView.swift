//
//  XJPushGuideView.swift
//  XJMissScarlett
//
//  Created by xj on 8/1/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJPushGuideView: UIView {
    let key = "CFBundleShortVersionString"
    var closeButton = UIButton(type: .Custom)
    var pushGuideTopView = UIImageView()
    var pushGuideMidView = UIImageView()
    var pushGuidebotView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        pushGuideTopView.image = UIImage(named: "pushguidetop")
        self.addSubview(pushGuideTopView)
        pushGuideMidView.image = UIImage(named: "pushguidemid")
        self.addSubview(pushGuideMidView)
        pushGuidebotView.image = UIImage(named: "pushguidebot")
        self.addSubview(pushGuidebotView)
        self.backgroundColor = UIColor.XJ_rgbColor(0, g: 0, b: 0, a: 0.7)
        self.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(self.close), forControlEvents: .TouchUpInside)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        pushGuideMidView.size = pushGuideMidView.image!.size
        pushGuideMidView.x = (self.width - pushGuideMidView.size.width)/2
        pushGuideMidView.y = (self.height - pushGuideMidView.size.height)/2
        
        
        pushGuidebotView.x = pushGuideMidView.x + pushGuideMidView.size.width/4
        pushGuidebotView.y = CGRectGetMaxY(pushGuideMidView.frame) + 5
        pushGuidebotView.size = pushGuidebotView.image!.size
//        pushGuidebotView.backgroundColor = UIColor.whiteColor()
        
        closeButton.x = pushGuidebotView.x
        closeButton.y = pushGuidebotView.y + pushGuidebotView.height/2
        closeButton.size.width = pushGuidebotView.size.width*4/5
        closeButton.size.height = pushGuidebotView.size.height/2
        
        pushGuideTopView.size = pushGuideTopView.image!.size
        pushGuideTopView.x = pushGuideMidView.x
        pushGuideTopView.y = pushGuideMidView.y - 50 - pushGuideTopView.size.height
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() -> Void {
        
        let currentVersion = NSBundle.mainBundle().infoDictionary![key]
        let sanboxVersion = NSUserDefaults.standardUserDefaults().stringForKey(key) ?? "0"
        
        if !currentVersion!.isEqualToString(sanboxVersion) {
            let window = UIApplication.sharedApplication().keyWindow!
            self.x = 0
            self.y = 0
            self.width = window.width
            self.height = window.height
            window.addSubview(self)
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: key)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        
        
    }
    func close() -> Void {
        self.removeFromSuperview()
    }
}



























