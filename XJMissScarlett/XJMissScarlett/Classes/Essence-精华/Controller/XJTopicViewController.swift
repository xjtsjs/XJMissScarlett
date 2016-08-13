//
//  XJWordViewController.swift
//  XJMissScarlett
//
//  Created by xj on 8/2/16.
//  Copyright © 2016 xj. All rights reserved.
//
import UIKit
enum XJTopicType:Int {
    case All = 1
    case Picture = 10
    case Word = 29
    case Voice = 31
    case Video = 41
}
class XJTopicViewController: UITableViewController {
    lazy var topics = [XJTopic]()
    var page = 0
    var maxtime = ""
    var params = [String:String]()
    private var XJTopicCellId = "topic"
    var type = XJTopicType.Word
    var xj:String{
        return self.parentViewController!.isKindOfClass(XJNewViewController.classForCoder()) ? "newlist":"list"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefresh()
        
        //添加刷新控件
    }
    func setupTableView() -> Void {
        let bottom = CGFloat(49)
        
        let top = CGFloat(99)
        self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0)
        self.tableView.separatorStyle = .None
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.scrollIndicatorInsets = self.tableView.contentInset
    }
    func setupRefresh() -> Void {
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(self.loadNewTopics))
        tableView.mj_header.automaticallyChangeAlpha = true
        tableView.mj_header.beginRefreshing()
        
        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(self.loadMoreTopics))
    }
    func loadNewTopics() -> Void {
        self.tableView.mj_footer.endRefreshing()
        
        params = [String:String]()
        params.updateValue(self.xj, forKey: "a")
        params.updateValue("data", forKey: "c")
        params.updateValue("\(self.type.rawValue)", forKey: "type")
        
        AFHTTPSessionManager().GET("http://api.budejie.com/api/api_open.php", parameters: params, progress: { (progress) in
            
            }, success: { (dataTask, responseObject) in
                
                self.maxtime = responseObject?.objectForKey("info")?.objectForKey("maxtime") as! String
                let items = responseObject?.objectForKey("list") as! [AnyObject]
                for item in items{
                    let model = XJTopic()
                    model.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                    self.topics.append(model)
                    
                }
                
                self.tableView.reloadData()
                self.tableView.mj_header.endRefreshing()
                self.page = 0
        }) { (dataTask, responseObject) in
            self.tableView.mj_header.endRefreshing()
        }
        
    }
    
    func loadMoreTopics() -> Void {
        self.tableView.mj_header.endRefreshing()
        self.page += 1
        var params = [String:String]()
        
        params.updateValue(self.xj, forKey: "a")
        params.updateValue("data", forKey: "c")
        params.updateValue("\(self.type.rawValue)", forKey: "type")
        params.updateValue("\(self.page)", forKey: "page")
        params.updateValue(self.maxtime, forKey: "maxtime")
        self.params = params
        AFHTTPSessionManager().GET("http://api.budejie.com/api/api_open.php", parameters: params, progress: { (progress) in
            
            }, success: { (dataTask, responseObject) in
                if self.params != params {return}
                self.maxtime = responseObject?.objectForKey("info")?.objectForKey("maxtime") as! String
                let items = responseObject?.objectForKey("list") as! [AnyObject]
                for item in items{
                    let topic = XJTopic()
                    topic.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                    self.topics.append(topic)
                }
                self.tableView.reloadData()
                self.tableView.mj_footer.endRefreshing()
        }) { (dataTask, error) in
            self.tableView.mj_footer.endRefreshing()
            self.page -= 1
        }
        
    }
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        tableView.mj_footer.hidden = (self.topics.count == 0)
        return topics.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier(XJTopicCellId) as? XJTopicCell
        if cell == nil {
            cell = XJTopicCell(style: .Default, reuseIdentifier: XJTopicCellId)
        }
        cell?.topic  = self.topics[indexPath.row]
        
        
        
        return cell!
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let topic = self.topics[indexPath.row]
        
        return topic.cellHeight
    }
    
}












