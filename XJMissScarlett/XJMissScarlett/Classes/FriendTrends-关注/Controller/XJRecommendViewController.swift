//
//  XJRecommendViewController.swift
//  XJMissScarlett
//
//  Created by xj on 7/30/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJRecommendViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var categories = [XJRecommendCategory]()
    var categoryTableView = UITableView()
    var XJCategoryId = "category"
    var users = [XJRecommendUser]()
    

    var userTableView = UITableView()
    var XJUserId = "user"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "推荐关注"
        self.loadCategories()
        setupTableViews()
        self.setupRefresh()
        
        
    
        
        
        }
    func loadCategories() -> Void {
        SVProgressHUD.showWithStatus("正在拼命加载...")
        var params = [String:String]()
        params.updateValue("category", forKey: "a")
        params.updateValue("subscribe", forKey: "c")
        let manager = AFHTTPSessionManager()
        manager.GET("http://api.budejie.com/api/api_open.php", parameters: params, progress: { (progress) in
            
            }, success: { (dataTask, responseObject) in
               
                SVProgressHUD.dismiss()
                let items = responseObject?.objectForKey("list") as! [AnyObject]
                for item in items{
                    let model = XJRecommendCategory()
                    model.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                    self.categories.append(model)
                }
                
                self.categoryTableView.reloadData()
                let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                self.categoryTableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .Top)
                self.userTableView.mj_header.beginRefreshing()
                
        }) { (dataTask, error) in
            SVProgressHUD.showErrorWithStatus("加载推荐信息失败")
//            SVProgressHUD.dismiss()
           
        }

    }
    
    func setupTableViews() -> Void {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        view.addSubview(categoryTableView)
        categoryTableView.separatorStyle = .None
        categoryTableView.tableFooterView = UIView()
        categoryTableView.backgroundColor = UIColor.XJ_globalBg()
        
     
        userTableView.dataSource = self
        view.addSubview(userTableView)
        userTableView.tableFooterView = UIView()
        userTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        userTableView.backgroundColor = UIColor.XJ_rgbColor(244, g: 244, b: 244, a: 1)
        self.automaticallyAdjustsScrollViewInsets = false
        categoryTableView.contentInset = userTableView.contentInset
        
        
    }
    var params = [String:String]()
    
    func setupRefresh() -> Void
    {
        self.userTableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { 
            let rc = self.categories[self.categoryTableView.indexPathForSelectedRow!.row]
            rc.currentPage = 1
            var params = [String:String]()
            params.updateValue("list", forKey: "a")
            params.updateValue("subscribe", forKey: "c")
            params.updateValue("\(rc.id)", forKey: "category_id")
            params.updateValue("\(rc.currentPage)", forKey: "page")
            self.params = params
            AFHTTPSessionManager().GET("http://api.budejie.com/api/api_open.php", parameters: params, progress: { (progress) in
            
            }, success: { (dataTask, responseObject) in
                let items = responseObject?.valueForKey("list") as!  [AnyObject]
                self.users.removeAll()
                for item in items{
                    let model = XJRecommendUser()
                    model.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                    self.users.append(model)
                }
                rc.total = responseObject!["total"] as! Int
                if self.params != params{ return}
                self.userTableView.reloadData()
                self.userTableView.mj_header.endRefreshing()
                self.checkFooterState()
            }, failure: { (dataTask, error) in
                if (self.params != params){return}
                SVProgressHUD.showWithStatus("加载用户数据失败")
                self.userTableView.mj_header.endRefreshing()
         })
        
        
        })
        self.userTableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            let rc = self.categories[self.categoryTableView.indexPathForSelectedRow!.row]
            rc.currentPage = 1
            var params = [String:String]()
            params.updateValue("list", forKey: "a")
            params.updateValue("subscribe", forKey: "c")
            params.updateValue("\(rc.id)", forKey: "category_id")
            params.updateValue("\(rc.currentPage += 1)", forKey: "page")
            self.params = params
            AFHTTPSessionManager().GET("http://api.budejie.com/api/api_open.php", parameters: params, progress: { (progress) in
                
                }, success: { (dataTask, responseObject) in
                    let items = responseObject?.valueForKey("list") as!  [AnyObject]
                    for item in items{
                        let model = XJRecommendUser()
                        model.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                        self.users.append(model)
                    }
                    rc.total = responseObject!["total"] as! Int
                    if self.params != params{ return}
                    self.userTableView.reloadData()
                    self.checkFooterState()
                }, failure: { (dataTask, error) in
                    if (self.params != params){return}
//                    SVProgressHUD.showWithStatus("加载用户数据失败")
                    self.userTableView.mj_footer.endRefreshingWithNoMoreData()
            })

        })
    }
    func checkFooterState() -> Void {
        
        let rc = self.categories[self.categoryTableView.indexPathForSelectedRow!.row]
        self.userTableView.mj_footer.hidden = (self.users.count == 0)
        if self.users.count == rc.total {
            self.userTableView.mj_footer.resetNoMoreData()
        }else{
            self.userTableView.mj_footer.endRefreshing()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.categoryTableView.width = view.width/5
        self.categoryTableView.height = view.height
        self.categoryTableView.center = CGPointMake(view.width/10, view.height/2)
        
        self.userTableView.width = view.width - categoryTableView.width
        self.userTableView.height = view.height
        self.userTableView.x = categoryTableView.width
        self.userTableView.y = 0
        
    }
    
  

}

extension XJRecommendViewController{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.userTableView.mj_header.endRefreshing()
//        self.userTableView.mj_footer.endRefreshing()
//        
//        
//        if self.users.count != 0 {
//            self.userTableView.reloadData()
//        }else{
//            self.userTableView.reloadData()
            self.userTableView.mj_header.beginRefreshing()
//        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.categoryTableView {
            return self.categories.count
        }
        else{
//            self.checkFooterState()
            
            return self.users.count
        }
       
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView == self.categoryTableView {
            var cell = tableView.dequeueReusableCellWithIdentifier(XJCategoryId) as? XJRecommendCategoryCell
            if cell == nil{
                cell = XJRecommendCategoryCell(style: .Default, reuseIdentifier: XJCategoryId)
            }
            cell?.category = self.categories[indexPath.row]
            return cell!
        }else{
            var cell = tableView.dequeueReusableCellWithIdentifier(XJUserId) as? XJRecommendUserCell
            if cell == nil {
                cell = XJRecommendUserCell(style: .Default, reuseIdentifier: XJUserId)
            }
            let model = self.users[indexPath.row]
            cell?.user = model
            
            return cell!
        
        }
    }

   }

















