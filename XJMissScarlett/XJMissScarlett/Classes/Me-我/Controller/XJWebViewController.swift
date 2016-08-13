//
//  XJWebViewController.swift
//  XJMissScarlett
//
//  Created by xj on 8/12/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJWebViewController: UIViewController ,UIWebViewDelegate{
    var url = ""
    var webView = UIWebView()
    var toolBar = UIToolbar()
    var goBackItem = UIBarButtonItem()
    var goForwardItem = UIBarButtonItem()
    var flexible = UIBarButtonItem()
    var refresh = UIBarButtonItem()
    
    
    var progressView = UIProgressView()
    var progress = NJKWebViewProgress()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(webView)
        view.addSubview(progressView)
        progressView.frame = CGRectMake(0, 64, self.view.width, 2)
        webView.delegate = self.progress
        weak var weakSelf = self
        self.progress.progressBlock = {(progress:Float) in
            weakSelf?.progressView.progress = progress
            weakSelf?.progressView.hidden = (progress == 1.0)
        
        }
        self.progress.webViewProxyDelegate = self
        webView.loadRequest(NSURLRequest(URL: NSURL(string: self.url)!))
        setupToolBar()
        
        
    }
    func setupToolBar() -> Void {
        view.addSubview(toolBar)
        goBackItem = UIBarButtonItem(title: "后退", style: .Plain, target: self, action: #selector(self.goBack(_:)))
        goForwardItem = UIBarButtonItem(title: "前进", style: .Plain, target: self, action: #selector(self.goForward(_:)))
        flexible = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(self.refresh(_:)))
        toolBar.items = [goBackItem,goForwardItem,flexible,refresh]
        toolBar.backgroundColor = UIColor.blueColor()
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        self.goBackItem.enabled = webView.canGoBack
        self.goForwardItem.enabled = webView.canGoForward
        
    }
    func goBack(barButtonItem:UIBarButtonItem) -> Void {
        webView.goBack()
    }
    func goForward(barButtonItem:UIBarButtonItem) -> Void {
        webView.goForward()
    }
    func refresh(barButtonItem:UIBarButtonItem) -> Void {
        webView.reload()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.toolBar.x = 0
        self.toolBar.y = view.height - 44
        self.toolBar.width = self.view.width
        self.toolBar.height = 44
        
        
        self.webView.x = 0
        self.webView.y = 0
        self.webView.width = view.width
        self.webView.height = view.height - 44
    }
    
    
}
