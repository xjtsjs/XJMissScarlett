//
//  XJTabBarController.swift
//  XJMissScarlett
//
//  Created by xj on 7/29/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let attrs = [NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.grayColor()]
        let selectedAttrs = [NSFontAttributeName:attrs[NSFontAttributeName]!,NSForegroundColorAttributeName:UIColor.darkGrayColor()]
        UITabBarItem.appearance().setTitleTextAttributes(attrs, forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttrs, forState: .Selected)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
       
        
        
        self.setupChildVc(XJEssenceViewController(), title: "精华", image: "tabBar_essence_icon", selectedImage: "tabBar_essence_click_icon")
        
        self.setupChildVc(XJNewViewController(), title: "新帖", image: "tabBar_new_icon", selectedImage: "tabBar_new_click_icon")
        
      self.setupChildVc(XJFriendTrendsViewController(), title: "关注", image: "tabBar_friendTrends_icon", selectedImage: "tabBar_friendTrends_click_icon")
       
       self.setupChildVc(XJMeViewController(), title: "我", image: "tabBar_me_icon", selectedImage: "tabBar_me_click_icon")
        self.setValue(XJTabBar(), forKeyPath: "tabBar")
           
        
        
    }
    func setupChildVc(vc:UIViewController,title:String,image:String,selectedImage:String) -> Void {
        vc.navigationItem.title = title
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: image)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.view.backgroundColor = UIColor.XJ_globalBg()
        let nav = XJNavigationController(rootViewController: vc)
       
        self.addChildViewController(nav)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




























