//
//  XJFriendTrendsViewController.swift
//  XJMissScarlett
//
//  Created by xj on 7/29/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJFriendTrendsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "我的关注"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.itemWith("friendsRecommentIcon", highImageName: "friendsRecommentIcon-click", target: self, action: #selector(self.friendsClick))
        setupChildViews()
    }
    func setupChildViews() -> Void {
        let iconView = UIImageView(image: UIImage(named: "header_cry_icon"))
        iconView.size = iconView.image!.size
        iconView.center = CGPointMake(view.width/2, view.height/2.8)
        view.addSubview(iconView)
        
        let labelView = UILabel()
        labelView.font = UIFont.systemFontOfSize(17)
        labelView.textAlignment = .Center
        labelView.numberOfLines = 0
        labelView.textColor = UIColor.XJ_rgbColor(152, g: 102, b: 56, a: 1)
        labelView.lineBreakMode = .ByWordWrapping
        labelView.text = "快快登录吧, 关注百思最in牛人\n好友动态让你把瘾儿~\n欧耶~~~~!"
        let text = labelView.text! as NSString
        let size = text.boundingRectWithSize(CGSizeMake(self.view.width/1.3, CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17)], context: nil).size
        labelView.size = size
        labelView.center = CGPointMake(view.width/2, view.height/2)
        view.addSubview(labelView)
        
        let loginView = UIButton(type: .Custom)
        loginView.setBackgroundImage(UIImage(named: "friendsTrend_login"), forState: .Normal)
        loginView.setBackgroundImage(UIImage(named: "friendsTrend_login_click"), forState: .Highlighted)
        loginView.setTitle("立即登录", forState: .Normal)
        loginView.titleLabel?.textAlignment = .Center
        loginView.setTitleColor(UIColor.redColor(), forState: .Normal)
        loginView.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        loginView.size = loginView.currentBackgroundImage!.size
        loginView.center = CGPointMake(view.width/2, view.height/1.6)
        loginView.addTarget(self, action: #selector(self.loginRegister), forControlEvents: .TouchUpInside)
        view.addSubview(loginView)
        
        
        
    }
    func friendsClick() -> Void {
        let vc = XJRecommendViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loginRegister() -> Void {
        let login = XJLoginRegisterViewController()
        self.presentViewController(login, animated: true, completion: nil)
        
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
