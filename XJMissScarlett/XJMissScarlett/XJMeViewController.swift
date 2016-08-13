//
//  XJMeViewController.swift
//  XJMissScarlett
//
//  Created by xj on 7/29/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJMeViewController: UITableViewController {
    let XJMeId = "me"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupTableView()
        
    }
    func setupNav() -> Void {
        navigationItem.title = "我的"
        let settingItem = UIBarButtonItem.itemWith("mine-setting-icon", highImageName: "mine-setting-icon-click", target: self, action: #selector(self.settingClick))
        let moonItem = UIBarButtonItem.itemWith("mine-moon-icon", highImageName: "mine-moon-icon-click", target: self, action: #selector(self.moonChlick))
        
        
        navigationItem.rightBarButtonItems = [settingItem,moonItem]
    }
    func setupTableView() -> Void {
        tableView.backgroundColor = UIColor.XJ_globalBg()
        tableView.separatorStyle = .None
        let xj = XJMeFooterView()
        xj.frame = CGRectMake(0, 0, 0, 843.75)
        tableView.tableFooterView = xj
        
        
        tableView.contentInset = UIEdgeInsetsMake(13, 0, 0, 0)

        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func settingClick() -> Void {
        
    }
    func moonChlick() -> Void {
        
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(XJMeId)
        if cell == nil {
            cell = XJMeCell(style: .Default, reuseIdentifier: XJMeId)
        }
        if indexPath.section == 0 {
            cell?.imageView?.image = UIImage(named: "mine-icon-nearby")
            cell?.textLabel?.text = "登陆/注册"
        }else if indexPath.section == 1{
            cell?.textLabel?.text = "离线下载"
        }
        return cell!
        
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 13
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
    }
}














