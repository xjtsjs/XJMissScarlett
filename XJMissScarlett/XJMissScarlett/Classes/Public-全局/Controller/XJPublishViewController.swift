//
//  XJPublishViewController.swift
//  XJMissScarlett
//
//  Created by xj on 8/9/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit
let XJAnimationDelay = 0.1
let XJSpringFactor = 10
class XJPublishViewController: UIViewController {
    let backImageView = UIImageView()
    let cancelButton = UIButton()
    let sloganView = UIImageView(image: UIImage(named: "app_slogan"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.userInteractionEnabled = false
        backImageView.image = UIImage(named: "shareBottomBackground")
        backImageView.frame = self.view.bounds
        view.addSubview(backImageView)
        
        cancelButton.backgroundColor = UIColor.XJ_rgbColor(241, g: 239, b: 238, a: 0.9)
        cancelButton.setTitle("取消", forState: .Normal)
        cancelButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        cancelButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        cancelButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        cancelButton.addTarget(self, action: #selector(self.cancel), forControlEvents: .TouchUpInside)
        cancelButton.width = self.view.width
        cancelButton.height = 40
        cancelButton.x = 0
        cancelButton.y = self.view.height - cancelButton.height
        view.addSubview(cancelButton)
        
        
        
        let images = ["publish-video", "publish-picture", "publish-text", "publish-audio", "publish-review", "publish-offline"]
        let titles = ["发视频", "发图片", "发段子", "发声音", "审帖", "离线下载"]
        let maxClos = CGFloat(3)
        let buttonW = CGFloat(72)
        let buttonH = buttonW + 30
        let buttonStartY = (XJScreenH - 2*buttonH)/2
        let buttonStarX = CGFloat(20)
        let xMargin = (XJScreenW - 2*buttonStarX - maxClos*buttonW)/(maxClos-1)
        for i in 0..<images.count {
            let button = XJVerticalButton()
            button.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: .TouchUpInside)
            button.tag = i+2000
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            button.setTitle(titles[i], forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setImage(UIImage(named: images[i]), forState: .Normal)
            let row = i/Int(maxClos)
            let col = i % Int(maxClos)
            let buttonX = buttonStarX + CGFloat(col)*(xMargin+buttonW)
            let buttonEndY = buttonStartY + CGFloat(row)*buttonH
            let buttonBeginY = buttonEndY - XJScreenH
            let anim = POPSpringAnimation(propertyNamed: kPOPViewFrame)
            anim.fromValue = NSValue(CGRect: CGRectMake(buttonX, buttonBeginY, buttonW, buttonH))
            anim.toValue = NSValue(CGRect: CGRectMake(buttonX, buttonEndY, buttonW, buttonH))
            anim.springBounciness = 10
            anim.springSpeed = 10
            anim.beginTime = CACurrentMediaTime() + 0.1*Double(i)
            button.pop_addAnimation(anim, forKey: nil)
            self.view.addSubview(button)
        }
        let centerEndY = view.height/5
        let centerX = view.width/2
        let centerBeginY = centerEndY - XJScreenH
        sloganView.y = centerBeginY
        let anim = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        anim.fromValue = NSValue(CGPoint: CGPointMake(centerX, centerBeginY))
        anim.toValue = NSValue(CGPoint: CGPointMake(centerX, centerEndY))
        anim.beginTime = CACurrentMediaTime() + Double(images.count)*Double(0.1)
        anim.springSpeed = 10
        anim.springBounciness = 10
        anim.completionBlock = {(animation, finished) in
            self.view.userInteractionEnabled = true
        }
        sloganView.pop_addAnimation(anim, forKey: nil)
        view.addSubview(sloganView)
        
        
        
        
    }
    func cancel() -> Void {
        cancelWithCompletion(nil)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        cancel()
    }
    
    func cancelWithCompletion(completionHandler:(()->Void)?) -> Void {
        self.view.userInteractionEnabled = false
        let beginIndex = 2
        for i in 2..<self.view.subviews.count {
            let subView = self.view.subviews[i]
            let anim = POPBasicAnimation(propertyNamed: kPOPViewCenter)
            let centerY = subView.center.y + XJScreenH
            anim.toValue = NSValue(CGPoint: CGPointMake(subView.center.x, centerY))
            anim.beginTime = CACurrentMediaTime() + Double(i - beginIndex)*0.1
            subView.pop_addAnimation(anim, forKey: nil)
            if i == self.view.subviews.count - 1 {
                anim.completionBlock = {(animation, finished) in
                    self.dismissViewControllerAnimated(false, completion: nil)
                    if let xj = completionHandler{
                        xj()
                    
                    }
                    
                }
            }
            
            
        }
        
    }
    func buttonClick(button:UIButton) -> Void {
        
        self.cancelWithCompletion { 
            if button.tag == 2000{
                print("发布视频")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
