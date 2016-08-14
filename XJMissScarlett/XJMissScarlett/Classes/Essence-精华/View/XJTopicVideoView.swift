//
//  XJTopicVideoView.swift
//  XJMissScarlett
//
//  Created by xj on 8/10/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class XJTopicVideoView: UIView {
    var topic = XJTopic(){
        didSet{
            self.imageView.sd_setImageWithURL(NSURL(string: topic.large_image))
            
            self.playcountLabel.text = String(format: "%zd播放",topic.playcount)
            
            let minute = topic.videotime/60
            let second = topic.videotime%60
            self.videotimeLabel.text = String(format: "%02zd:%02zd", minute,second)
        
        
        }
    }
    
    var imageView = UIImageView()
    var playcountLabel = UILabel()
    var videotimeLabel = UILabel()
    var playButton = UIButton()
    var backImageView = UIImageView()
    override func layoutSubviews() {
        super.layoutSubviews()
        backImageView.x = 0
        backImageView.y = 20
        backImageView.width = self.width
        backImageView.height = 25
        
        playcountLabel.size = (playcountLabel.text! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        playcountLabel.size.width = playcountLabel.size.width + 2
        playcountLabel.layoutIfNeeded()
        playcountLabel.x = 0
        playcountLabel.y = self.height - playcountLabel.height
        
        videotimeLabel.size = (videotimeLabel.text! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        videotimeLabel.size.width  = videotimeLabel.size.width + 2
        videotimeLabel.layoutIfNeeded()
        videotimeLabel.x = self.width - videotimeLabel.width
        videotimeLabel.y = self.height - videotimeLabel.height
        
        playButton.width = 63
        playButton.height = 63
        playButton.center.x = self.width/2
        playButton.center.y = self.height/2
        
        imageView.frame = self.bounds
        
        
        
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.autoresizingMask = .None
        self.backgroundColor = UIColor.XJ_rgbColor(220, g: 220, b: 220, a: 1)
        self.addSubview(backImageView)
        backImageView.image = UIImage(named: "imageBackground")
        backImageView.contentMode = .ScaleAspectFit
        
        self.addSubview(imageView)
        
        self.addSubview(playcountLabel)
        playcountLabel.font = UIFont.systemFontOfSize(12)
        playcountLabel.backgroundColor = UIColor.XJ_rgbColor(0, g: 0, b: 0, a: 0.7)
        playcountLabel.text = "222222"
        playcountLabel.textColor = UIColor.whiteColor()
        
        self.addSubview(videotimeLabel)
        videotimeLabel.font = UIFont.systemFontOfSize(12)
        videotimeLabel.backgroundColor = UIColor.XJ_rgbColor(0, g: 0, b: 0, a: 0.7)
        videotimeLabel.text = "222222"
        videotimeLabel.textColor = UIColor.whiteColor()
        
        self.addSubview(playButton)
        playButton.setBackgroundImage(UIImage(named: "video-play"), forState: .Normal)
        playButton.userInteractionEnabled = false
        self.imageView.userInteractionEnabled = true
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.showVideo)))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func showVideo() -> Void {
        let videoURL = NSURL(string: topic.videouri)
        let player = AVPlayer(URL: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        
        
        
    }
    
}
