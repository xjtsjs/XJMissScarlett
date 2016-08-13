//
//  XJMeFooterView.swift
//  XJMissScarlett
//
//  Created by xj on 8/12/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJMeFooterView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
        var params = [String:String]()
        params["a"] = "square"
        params["c"] = "topic"
        AFHTTPSessionManager().GET("http://api.budejie.com/api/api_open.php", parameters: params, progress: { (progress) in
            
            }, success: { (dataTask, responseObject) in
                let items = responseObject?.objectForKey("square_list") as! [AnyObject]
                
                var sqaures = [XJSquare]()
                for item in items{
                    let  square = XJSquare()
                    square.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                    sqaures.append(square)
                }
                self.createSquares(sqaures)
            }) { (dataTask, error) in
                
        }
    }
    func createSquares(squres:[XJSquare]) -> Void {
        let maxCols = 4
        let buttonW = XJScreenW/CGFloat(maxCols)
        let buttonH = buttonW
        
        for i in 0..<squres.count {
            let button = XJSqaureButton(type: .Custom)
            button.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: .TouchUpInside)
            button.square = squres[i]
            self.addSubview(button)
            
            
            let col = i % maxCols
            let row = i/maxCols
            
            button.x = CGFloat(col) * buttonW
            button.y = CGFloat(row) * buttonH
            button.width = buttonW
            button.height = buttonH
            
            
            
        }
        let rows = (squres.count + maxCols - 1) / maxCols
        self.height = CGFloat(rows) * buttonH
        
        
        self.setNeedsDisplay()
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func buttonClick(button:XJSqaureButton) -> Void {
        if !button.square.url.hasPrefix("http"){return}
        let web = XJWebViewController()
        web.url = button.square.url
        web.title = button.square.name
        let tabBarVc = UIApplication.sharedApplication().keyWindow?.rootViewController as! UITabBarController
        let nav = tabBarVc.selectedViewController as! UINavigationController
        nav.pushViewController(web, animated: true)
        
        
        
    }
    
}

























