//
//  XJEssenceViewController.swift
//  XJMissScarlett
//
//  Created by xj on 7/29/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJEssenceViewController: UIViewController ,UIScrollViewDelegate{
    var indicatorView = UIView()
    
    var selectedButton = UIButton()
    
    var titlesView = UIScrollView()
    
    var contentView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
        
        setupChildVces()
        
        setupTitlesView()
        
        setupContentView()
    }
    
    func setupNav() -> Void {
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWith("MainTagSubIcon", highImageName: "MainTagSubIconClick", target: self, action: #selector(self.tagClick))
    }
    func tagClick() -> Void {
        let vc = XJRecommendViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func setupChildVces() -> Void {
        let all = XJTopicViewController()
        all.navigationItem.title = "全部"
        all.type = .All
        self.addChildViewController(all)
        
        let video = XJTopicViewController()
        video.navigationItem.title = "视频"
        video.type = .Video
        self.addChildViewController(video)
        
        let voice = XJTopicViewController()
        voice.navigationItem.title = "声音"
        voice.type = .Voice
        self.addChildViewController(voice)
        
        let picture = XJTopicViewController()
        picture.type = .Picture
        picture.navigationItem.title = "图片"
        self.addChildViewController(picture)
        
        let word = XJTopicViewController()
        word.type = .Word
        word.navigationItem.title = "段子"
        self.addChildViewController(word)
        
    }
    func setupTitlesView() -> Void {
        self.automaticallyAdjustsScrollViewInsets = false
        titlesView.showsVerticalScrollIndicator = false
        titlesView.showsHorizontalScrollIndicator = false
        titlesView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.68)
        titlesView.width = view.width
        titlesView.height = 35
        titlesView.y = 64
        titlesView.x = 0
        titlesView.contentSize.height = titlesView.height
        titlesView.contentSize.width = titlesView.width + 20
        view.addSubview(titlesView)
        
        indicatorView.backgroundColor = UIColor.redColor()
        indicatorView.height = 2
        indicatorView.tag = 2000 - 1
        indicatorView.y = titlesView.height - indicatorView.height
        
        
        let titles = ["全部","视频","声音","图片","段子"]
        let buttonW = titlesView.width/CGFloat(titles.count)
        let buttonH = titlesView.height
        for i in 0..<titles.count {
            let button = UIButton()
            button.tag = 2000 + i
            button.height = buttonH
            button.width = buttonW
            button.x = CGFloat(i)*buttonW
            button.setTitle(titles[i], forState: .Normal)
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            button.setTitleColor(UIColor.redColor(), forState: .Disabled)
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            button.addTarget(self, action: #selector(self.titleClick(_:)), forControlEvents: .TouchUpInside)
            titlesView.addSubview(button)
            if i == 0 {
                button.enabled = false
                self.selectedButton = button
                button.titleLabel?.sizeToFit()
                self.indicatorView.width = button.titleLabel!.width
                self.indicatorView.center.x = button.center.x
            }
            
            
        }
        
        titlesView.addSubview(indicatorView)
        
    }
    func titleClick(button:UIButton) -> Void {
        self.selectedButton.enabled = true
        button.enabled = false
        self.selectedButton = button
        UIView.animateWithDuration(0.25) { 
            self.indicatorView.width = button.titleLabel!.width
            self.indicatorView.center.x = button.center.x
            
        }
        //
        var offset = self.contentView.contentOffset
        offset.x = CGFloat(button.tag - 2000)  * self.contentView.width
        self.contentView .setContentOffset(offset, animated: true)
        
    }
    
    func setupContentView() -> Void {
        self.automaticallyAdjustsScrollViewInsets = false
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.pagingEnabled = true
        view.insertSubview(contentView, atIndex: 0)
        contentView.contentSize = CGSizeMake(contentView.width*CGFloat(self.childViewControllers.count), 0)
        self.scrollViewDidEndScrollingAnimation(contentView)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK: - UIScrollViewDelegate
extension XJEssenceViewController{
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x/scrollView.width
        let vc = self.childViewControllers[Int(index)] as! UITableViewController
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        
        scrollView.addSubview(vc.view)
        
        
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
        let index = scrollView.contentOffset.x/scrollView.width
        self.titleClick(self.titlesView.subviews[Int(index)] as! UIButton)
        
    }
}


















