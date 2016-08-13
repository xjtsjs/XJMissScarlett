//
//  XJViewController.swift
//  XJMissScarlett
//
//  Created by xj on 7/30/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJNavigationController: UINavigationController {
        override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: .Default)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        SVProgressHUD.dismiss()
        return super.popViewControllerAnimated(true)
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        SVProgressHUD.dismiss()
        if self.childViewControllers.count > 0 {
            let button = UIButton(type: .Custom)
            button.setTitle("返回", forState: .Normal)
            button.setImage(UIImage(named: "navigationButtonReturn"), forState: .Normal)
            button.setImage(UIImage(named: "navigationButtonReturnClick"), forState: .Highlighted)
            button.size = CGSizeMake(70, 30)
            button.contentHorizontalAlignment = .Left
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
            button.addTarget(self, action: #selector(self.back), forControlEvents: .TouchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            viewController.hidesBottomBarWhenPushed = true
            viewController.view.backgroundColor = UIColor.XJ_globalBg()
        }
        
        super.pushViewController(viewController, animated: true)
        
        
    }
    func back() -> Void {
        self.popViewControllerAnimated(true)
    }
    

}
























