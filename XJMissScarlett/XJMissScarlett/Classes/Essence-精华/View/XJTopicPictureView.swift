//
//  XJTopicPictureView.swift
//  XJMissScarlett
//
//  Created by xj on 8/4/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTopicPictureView: UIView {
   
    
    var topic = XJTopic(){
        didSet{
//            self.progressView.setProgress(topic.pictureProgress, animated: true)
//            let text =  String(format: "%.0f%%", topic.pictureProgress*100)
//            self.progressView.progressLabel.text = text.stringByReplacingOccurrencesOfString("-", withString: "")
           self.imageView.sd_setImageWithURL(NSURL(string: topic.large_image), placeholderImage: nil, options: .RetryFailed, progress: { (receivedSize, expectedSize) in
                self.progressView.hidden = false
                let progress = CGFloat(receivedSize)/CGFloat(expectedSize)
                self.topic.pictureProgress = progress
                self.progressView.setProgress(progress, animated: false)
                let text =  String(format: "%.0f%%", progress*100)
                self.progressView.progressLabel.text = text.stringByReplacingOccurrencesOfString("-", withString: "")
            }) { (image, error, cacheType, imageURL) in
                self.progressView.hidden = true
                if self.topic.bigPicture == false {return}
                UIGraphicsBeginImageContextWithOptions(self.topic.pictureF.size, true, 0.0)
                let width = self.topic.pictureF.size.width
                let height = width*image.size.height/image.size.width
                image.drawInRect(CGRectMake(0, 0, width, height))
                
                self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndPDFContext()
                    
                
            }
           
            let xj = (topic.large_image as NSString).pathExtension
            self.gifView.hidden = !(xj.lowercaseString == "gif")
            if topic.bigPicture {
                self.seeBigButton.hidden = false
//                self.imageView.contentMode = .ScaleAspectFill
            }else{
                self.seeBigButton.hidden = true
//                self.imageView.contentMode = .ScaleAspectFill
            }
            
        }
    
    }
    var imageBackground = UIImageView()
    var imageView = UIImageView()
    var gifView = UIImageView()
    var seeBigButton = UIButton()
    var progressView = DALabeledCircularProgressView(frame: CGRectMake(0, 0, 0, 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.XJ_rgbColor(220, g: 220, b: 220, a: 1)
        self.insertSubview(imageBackground, atIndex: 0)
        imageBackground.image = UIImage(named: "imageBackground")
        imageBackground.contentMode = .ScaleAspectFit
        self.autoresizingMask = .None
        self.addSubview(progressView)
        self.progressView.roundedCorners = 3
        self.progressView.progressLabel.textColor = UIColor.whiteColor()
        self.addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.clearColor()
        self.imageView.userInteractionEnabled = true
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.showPictrue)))
        self.addSubview(gifView)
        self.gifView.image = UIImage(named: "common-gif")
        self.addSubview(seeBigButton)
        self.seeBigButton.setImage(UIImage(named: "see-big-picture"), forState: .Normal)
        self.seeBigButton.setTitle("点击查看全图", forState: .Normal)
        self.seeBigButton.setBackgroundImage(UIImage(named: "see-big-picture-background"), forState: .Normal)
        self.seeBigButton.userInteractionEnabled = false
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func showPictrue() -> Void {
        let showPicture = XJShowPictureViewController()
        showPicture.topic = self.topic
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(showPicture, animated: true, completion: nil)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = self.bounds
        
        
        self.imageBackground.x = 0
        self.imageBackground.y = 20
        self.imageBackground.width = self.width
        self.imageBackground.height = 25
        
        self.gifView.x = 0
        self.gifView.y = 0
        self.gifView.size = self.gifView.image!.size
        
        self.seeBigButton.width = self.width
        self.seeBigButton.height = 43
        self.seeBigButton.x = 0
        self.seeBigButton.y = self.height - 43
        
        self.progressView.width = 100
        self.progressView.height = 100
        self.progressView.center.x = self.center.x
        self.progressView.y = CGRectGetMaxY(imageBackground.frame) + CGFloat(25)
    }

}























