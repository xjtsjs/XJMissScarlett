//
//  XJSqaureButton.swift
//  XJMissScarlett
//
//  Created by xj on 8/12/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJSqaureButton: UIButton {
    var square = XJSquare(){
        didSet{
            self.setTitle(square.name, forState: .Normal)
            self.sd_setImageWithURL(NSURL(string: square.icon), forState: .Normal)
        }
    
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() -> Void {
        self.titleLabel?.textAlignment = .Center
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(15)
        self.setBackgroundImage(UIImage(named: "mainCellBackground"), forState: .Normal)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.y = self.height*0.15
        self.imageView?.width = self.width/2
        self.imageView?.height = self.imageView!.width
        self.imageView?.center.x = self.width/2
        
        
        self.titleLabel?.x = 0
        self.titleLabel?.y = CGRectGetMaxY(self.imageView!.frame)
        self.titleLabel?.width = self.width
        self.titleLabel?.height = self.height - self.titleLabel!.y
    }

}























