//
//  XJTopicVoiceView.swift
//  XJMissScarlett
//
//  Created by xj on 8/10/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTopicVoiceView: UIView {
    var imageView = UIImageView()
    var voicetimeLabel = UILabel()
    var playcountLabel = UILabel()
    var backImageView = UIImageView()
    var playButton = UIButton()
    override func layoutSubviews() {
        super.layoutSubviews()
        backImageView.x = 0
        backImageView.y = 20
        backImageView.width = self.width
        backImageView.height = 25
        
        playcountLabel.size = (playcountLabel.text! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        playcountLabel.size.width = playcountLabel.size.width + 2
        
        playcountLabel.x = 0
        playcountLabel.y = self.height - playcountLabel.size.height
        
        voicetimeLabel.size = (voicetimeLabel.text! as NSString).sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        voicetimeLabel.size.width  = voicetimeLabel.size.width + 2
        
        voicetimeLabel.x = self.width - voicetimeLabel.width
        voicetimeLabel.y = self.height - voicetimeLabel.height
        
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
        
        self.addSubview(voicetimeLabel)
        voicetimeLabel.font = UIFont.systemFontOfSize(12)
        voicetimeLabel.backgroundColor = UIColor.XJ_rgbColor(0, g: 0, b: 0, a: 0.7)
        voicetimeLabel.text = "222222"
        voicetimeLabel.textColor = UIColor.whiteColor()
        
        self.addSubview(playButton)
        playButton.setImage(UIImage(named: "playButtonPlay"), forState: .Normal)
        playButton.setBackgroundImage(UIImage(named: "playButton"), forState: .Normal)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var topic = XJTopic(){
    
        didSet{
            self.imageView.sd_setImageWithURL(NSURL(string: topic.large_image))
            self.playcountLabel.text = String(format: "%zd播放",topic.playcount)
           
            let minute = topic.voicetime/60
            let second = topic.voicetime%60
            self.voicetimeLabel.text = String(format: "%02zd:%02zd", minute,second)
            
            
            
        
        }
    }
    

}



























