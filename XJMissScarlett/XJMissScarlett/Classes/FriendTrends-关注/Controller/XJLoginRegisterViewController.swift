//
//  XJLoginRegisterViewController.swift
//  XJMissScarlett
//
//  Created by xj on 7/31/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJLoginRegisterViewController: UIViewController,UITextFieldDelegate {
    var bgView = UIImageView(image: UIImage(named: "login_register_background"))
    var dismissView = UIButton()
    var bottomView = XJLoginBottomView()
    var longinView = XJLoginView()
    var registerView = XJLoginView()
    var loginOrRegisterButton = UIButton(type: .Custom)
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupChildViews() -> Void {
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(bgView)
        dismissView = UIButton(type: .Custom)
        view.addSubview(dismissView)
        dismissView.setBackgroundImage(UIImage(named: "login_close_icon"), forState: .Normal)
        dismissView.addTarget(self, action: #selector(self.loginClose), forControlEvents: .TouchUpInside)
        view.addSubview(bottomView)
        
        view.addSubview(longinView)
        longinView.textView.pwdView.delegate = self
        longinView.textView.uidView.delegate = self
        view.addSubview(registerView)
        registerView.textView.uidView.delegate = self
        registerView.textView.pwdView.delegate = self
        registerView.textView.uidView.placeholder = "请输入手机号"
        registerView.textView.pwdView.placeholder = "设置密码"
        registerView.loginButton.setTitle("注册", forState: .Normal)
        registerView.forgetLabel.hidden = true
//        registerView.backgroundColor = UIColor.lightGrayColor()
//        registerView.backgroundColor = UIColor.redColor()
        
        view.addSubview(loginOrRegisterButton)
        loginOrRegisterButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        loginOrRegisterButton.setTitle("注册账号", forState: .Normal)
        loginOrRegisterButton.setTitle("已有账号？", forState: .Selected)
        loginOrRegisterButton.titleLabel?.textAlignment = .Right
        loginOrRegisterButton.tintColor = UIColor.whiteColor()
        loginOrRegisterButton.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        loginOrRegisterButton.addTarget(self, action: #selector(self.showLoginOrRegister(_:)), forControlEvents: .TouchUpInside)
        
    }
    var flag = true
    
    func showLoginOrRegister(button:UIButton) -> Void {
        if flag {
            button.selected = true
            flag = false
            UIView.animateWithDuration(0.25, animations: {
                self.view.endEditing(true)
                }, completion: { (xj) in
                    UIView.animateWithDuration(0.25, animations: { 
                        self.longinView.x = -self.view.width
                        self.registerView.x = 0
                    })
            })
            
        }else{
            flag = true
            button.selected = false
            UIView.animateWithDuration(0.25, animations: {
                self.view.endEditing(true)
                }, completion: { (xj) in
                    UIView.animateWithDuration(0.25, animations: { 
                        self.longinView.x = 0
                        self.registerView.x = self.view.width
                    })
            })
        }
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        bgView.x = 0
        bgView.y = 0
        bgView.width = view.width
        bgView.height = view.height
        
        dismissView.x = 10
        dismissView.y = 64
        dismissView.size = dismissView.currentBackgroundImage!.size
        
        loginOrRegisterButton.y = dismissView.y
        loginOrRegisterButton.size.height = (loginOrRegisterButton.currentTitle! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(16)]).height
        loginOrRegisterButton.width = 100
        loginOrRegisterButton.x = view.width - loginOrRegisterButton.width - 10
        
        bottomView.width = view.width
        bottomView.height = view.height/4
        bottomView.x = 0
        bottomView.y = view.height*3/4
        
        longinView.x = 0
        longinView.y = CGRectGetMaxY(dismissView.frame) + 60
        longinView.width = view.width
        longinView.height = 200
        
        registerView.width = view.width
        registerView.height = 200
        registerView.y = CGRectGetMaxY(dismissView.frame) + 60
        registerView.x = view.width
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    func loginClose() -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
