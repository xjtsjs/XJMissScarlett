//
//  XJLoginBottomView.swift
//  XJMissScarlett
//
//  Created by xj on 7/31/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJLoginBottomView: UIView {
    var leftLineView = UIImageView()
    var loginLabel = UILabel()
    var rightLineView = UIImageView()
    var centerButton = UIButton()
    var leftButton = UIButton()
    var rightButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupChildViews()
    }
    
    func setupChildViews() -> Void {
        self.addSubview(leftLineView)
        leftLineView.image = UIImage(named: "login_register_left_line")
        
        self.addSubview(loginLabel)
        loginLabel.text = "快速登录"
        loginLabel.font = UIFont.systemFontOfSize(14)
        loginLabel.textColor = UIColor.whiteColor()
        loginLabel.textAlignment = .Center
        
        self.addSubview(rightLineView)
        rightLineView.image = UIImage(named: "login_register_right_line")
        
        centerButton = XJVerticalButton(type: .Custom)
        centerButton.setImage(UIImage(named: "login_sina_icon"), forState: .Normal)
        centerButton.setImage(UIImage(named: "login_sina_icon_click"), forState: .Highlighted)
        centerButton.setTitle("微博登录", forState: .Normal)
        centerButton.titleLabel?.font = UIFont.systemFontOfSize(14)
        self.addSubview(centerButton)
        
        leftButton = XJVerticalButton(type: .Custom)
        self.addSubview(leftButton)
        leftButton.setImage(UIImage(named: "login_QQ_icon"), forState: .Normal)
        leftButton.setImage(UIImage(named: "login_QQ_icon_click"), forState: .Highlighted)
        leftButton.setTitle("QQ登录", forState: .Normal)
        leftButton.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        rightButton = XJVerticalButton(type: .Custom)
        self.addSubview(rightButton)
        rightButton.setImage(UIImage(named: "login_tecent_icon"), forState: .Normal)
        rightButton.setImage(UIImage(named: "login_tecent_icon_click"), forState: .Highlighted)
        rightButton.setTitle("腾讯微博", forState: .Normal)
        rightButton.titleLabel?.font = UIFont.systemFontOfSize(14)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        loginLabel.size = (loginLabel.text! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(14)])
        loginLabel.y = 10
        loginLabel.x = self.center.x - loginLabel.size.width/2
        
        leftLineView.size = leftLineView.image!.size
        leftLineView.center.y = loginLabel.center.y
        leftLineView.x = loginLabel.x - 5 - leftLineView.size.width
        
        rightLineView.size = rightLineView.image!.size
        rightLineView.center.y = leftLineView.center.y
        rightLineView.x = CGRectGetMaxX(loginLabel.frame) + 2
        
        centerButton.y = CGRectGetMaxY(loginLabel.frame) + 10
        centerButton.center.x = loginLabel.center.x
        centerButton.width = centerButton.currentImage!.size.width
        centerButton.height = centerButton.currentImage!.size.height + (centerButton.titleLabel!.text! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(14)]).height + 5
        
        leftButton.center.y = centerButton.center.y
        leftButton.x = 20
        leftButton.size = centerButton.size
        
        rightButton.center.y = centerButton.center.y
        rightButton.size = centerButton.size
        rightButton.x = self.width - 20 - rightButton.size.width
        
        
    }
    
    
}
