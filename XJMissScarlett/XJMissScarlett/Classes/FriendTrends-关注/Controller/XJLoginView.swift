//
//  XJLoginView.swift
//  XJMissScarlett
//
//  Created by xj on 7/31/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJLoginView: UIView {
    var textView = XJTextFieldView()
    var loginButton = UIButton()
    var forgetLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textView)
        
        
        self.addSubview(loginButton)
        loginButton.setBackgroundImage(UIImage(named: "login_register_button"), forState: .Normal)
        loginButton.setBackgroundImage(UIImage(named: "login_register_button_click"), forState: .Highlighted)
        loginButton.setTitle("登录", forState: .Normal)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        loginButton.tintColor = UIColor.whiteColor()
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        
        self.addSubview(forgetLabel)
        forgetLabel.text = "忘记密码？"
        forgetLabel.textColor = UIColor.whiteColor()
        forgetLabel.textAlignment = .Right
        forgetLabel.font = UIFont.systemFontOfSize(14)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.size = textView.bgView.image!.size
        textView.y = 0
        textView.x = (self.width - textView.width)/2
        
        loginButton.x = textView.x
        loginButton.y = CGRectGetMaxY(textView.frame) + 15
        loginButton.size.height = loginButton.currentBackgroundImage!.size.height
        loginButton.size.width = textView.size.width
        
        forgetLabel.size = (forgetLabel.text! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(14)])
        forgetLabel.x = CGRectGetMaxX(loginButton.frame) - forgetLabel.width
        forgetLabel.y = CGRectGetMaxY(loginButton.frame) + 15
    }

}
