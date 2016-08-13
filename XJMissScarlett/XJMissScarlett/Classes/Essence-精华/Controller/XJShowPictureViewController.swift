//
//  XJShowPictureViewController.swift
//  XJMissScarlett
//
//  Created by xj on 8/8/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJShowPictureViewController: UIViewController {
    var topic = XJTopic()
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    var backButton = UIButton()
    var relayButton = UIButton()
    var saveButton = UIButton()
    var progressView = DALabeledCircularProgressView(frame: CGRectMake(0, 0, 0, 0))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        let screenH = UIScreen.mainScreen().bounds.size.height
        let screenW = UIScreen.mainScreen().bounds.size.width
        view.addSubview(scrollView)
        
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.back)))
        self.scrollView.addSubview(imageView)
        let pictureW = screenW
        let pictrueH = pictureW * self.topic.height / self.topic.width
        if pictrueH > screenH {
            imageView.frame = CGRectMake(0, 0, pictureW, pictrueH)
            self.scrollView.contentSize = CGSizeMake(0, pictrueH)
        }else{
            imageView.size = CGSizeMake(pictureW, pictrueH)
            imageView.center.y = screenH/2
            imageView.x = 0
        }
        self.view.addSubview(progressView)
        progressView.progressLabel.textColor = UIColor.whiteColor()
        progressView.roundedCorners = 3
        
        self.progressView.setProgress(topic.pictureProgress, animated: true)
        let text =  String(format: "%.0f%%", topic.pictureProgress*100)
        self.progressView.progressLabel.text = text.stringByReplacingOccurrencesOfString("-", withString: "")
        imageView.sd_setImageWithURL(NSURL(string: self.topic.large_image), placeholderImage: nil, options: .RetryFailed, progress: { (receivedSize, expectedSize) in
            let progress = CGFloat(receivedSize)/CGFloat(expectedSize)
            self.progressView.setProgress(progress, animated: false)
            self.progressView.progressLabel.text = String(format: "%.0f%%", progress*100)
            }) { (image, error, cacheType, imageURL) in
                self.progressView.hidden = true
        }
        
        view.addSubview(backButton)
        backButton.setImage(UIImage(named: "show_image_back_icon"), forState: .Normal)
        backButton.addTarget(self, action: #selector(self.back), forControlEvents: .TouchUpInside)
        view.addSubview(relayButton)
        relayButton.setTitle("转发", forState: .Normal)
        relayButton.backgroundColor = UIColor.XJ_rgbColor(220, g: 220, b: 220, a: 0.5)
        view.addSubview(saveButton)
        self.saveButton.setTitle("保存", forState: .Normal)
        self.saveButton.backgroundColor = UIColor.XJ_rgbColor(220, g: 220, b: 220, a: 0.5)
        saveButton.addTarget(self, action: #selector(self.save), forControlEvents: .TouchUpInside)
    }
    func back() -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func save() -> Void {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image!, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
//    - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
    func image(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:AnyObject) -> Void {
        if error != nil {
            SVProgressHUD.showErrorWithStatus("保存失败")
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)), dispatch_get_main_queue(), {
                SVProgressHUD.dismiss()
            })
        }else{
        
            SVProgressHUD.showSuccessWithStatus("保存成功")
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)), dispatch_get_main_queue(), { 
                SVProgressHUD.dismiss()
            })
        
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.frame = view.bounds
        backButton.frame = CGRectMake(15, 40, 35, 35)
        saveButton.width = 70
        saveButton.height = 25
        saveButton.x = self.view.width - saveButton.width - 30
        saveButton.y = self.view.height - saveButton.height - 25
        relayButton.width = saveButton.width
        relayButton.height = saveButton.height
        relayButton.x = saveButton.x - relayButton.width - 15
        relayButton.y = saveButton.y
        
        progressView.width = 100
        progressView.height = 100
        progressView.center = self.view.center
    }

}



























