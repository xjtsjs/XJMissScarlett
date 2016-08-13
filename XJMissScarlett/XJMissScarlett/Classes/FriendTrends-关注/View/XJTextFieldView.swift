//
//  XJTextFieldView.swift
//  XJMissScarlett
//
//  Created by xj on 7/31/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTextFieldView: UIView {
    var uidView = XJTextField()
    var pwdView = XJTextField()
    var bgView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        uidView.placeholder = "手机号"
        uidView.textColor = UIColor.whiteColor()
        uidView.tintColor = uidView.textColor
        uidView.resignFirstResponder()
//        uidView.keyboardType = .PhonePad
        self.addSubview(uidView)
        pwdView.placeholder = "密码"
        pwdView.textColor = UIColor.whiteColor()
        pwdView.tintColor = pwdView.textColor
        self.addSubview(pwdView)
        self.addSubview(bgView)
        pwdView.resignFirstResponder()
        bgView.image = UIImage(named: "login_rgister_textfield_bg")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        uidView.x = 8
        uidView.y = 0
        uidView.width = self.width - 2*uidView.x
        uidView.height = self.height/2
        
        pwdView.x = uidView.x
        pwdView.y = uidView.height
        pwdView.width = uidView.width
        pwdView.height = uidView.height
        
        bgView.size = bgView.image!.size
        bgView.x = 0
        bgView.y = 0
        
        
    }
    
}
