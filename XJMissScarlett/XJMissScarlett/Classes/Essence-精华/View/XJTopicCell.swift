//
//  XJTopicCell.swift
//  XJMissScarlett
//
//  Created by xj on 8/3/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTopicCell: UITableViewCell {
    var topic = XJTopic(){
        didSet{
            self.cellTopView.profileImageView.sd_setImageWithURL(NSURL(string: topic.profile_image), placeholderImage: UIImage(named: "defaultUserIcon"))
            self.cellTopView.nameLabel.text = topic.name
            self.cellTopView.createTimeLabel.text = topic.create_time
            
            self.cellbottomView.dingButton.setTitle("\(topic.ding)", forState: .Normal)
            self.cellbottomView.caiButton.setTitle("\(topic.cai)", forState: .Normal)
            self.cellbottomView.shareButton.setTitle("\(topic.repost)", forState: .Normal)
            self.cellbottomView.commentButton.setTitle("\(topic.comment)", forState: .Normal)
            self.text_label.text = topic.text
            if topic.type == XJTopicType.Picture.rawValue{
                self.pictureView.hidden = false
                self.pictureView.topic = topic
                self.pictureView.frame = topic.pictureF
                self.voiceView.hidden = true
                self.videoView.hidden = true

            }else if topic.type == XJTopicType.Voice.rawValue{
                self.voiceView.hidden = false
                self.voiceView.topic = topic
                self.voiceView.frame = topic.voiceF
                self.pictureView.hidden = true
                self.videoView.hidden = true
            }else if topic.type == XJTopicType.Video.rawValue{
                self.videoView.hidden = false
                
                self.videoView.topic = topic
                self.videoView.frame = topic.videoF
                
                self.voiceView.hidden = true
                self.pictureView.hidden = true
            }else{
                self.videoView.hidden = true
                self.voiceView.hidden = true
                self.pictureView.hidden = true
            
            }
        
        }
    
    }
    lazy var videoView:XJTopicVideoView = {
        let myVideoView = XJTopicVideoView()
        self.contentView.addSubview(myVideoView)
        return myVideoView
    }()
    
    lazy var voiceView:XJTopicVoiceView = {
        let myVoiceView = XJTopicVoiceView()
        self.contentView.addSubview(myVoiceView)
        return myVoiceView
    
    }()
    
    var cellTopView = XJCellTopView()
    var cellbottomView = XJCellBottomView()
    var text_label = UILabel()
    lazy var pictureView:XJTopicPictureView = {
        let myPictureView = XJTopicPictureView()
        self.contentView.addSubview(myPictureView)
        return myPictureView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellTopView)
        self.contentView.addSubview(cellbottomView)
        self.contentView.addSubview(text_label)
        self.text_label.numberOfLines = 0
        self.text_label.font = UIFont.systemFontOfSize(14)
        self.backgroundView = UIImageView(image: UIImage(named: "mainCellBackground"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect{
        didSet{
            var xjFrame = frame
            xjFrame.origin.x = XJCellmargin/2
            xjFrame.size.width -= 2*XJCellmargin/2
            xjFrame.size.height -= XJCellmargin/2
            xjFrame.origin.y += XJCellmargin/2
            super.frame = xjFrame
        }
        
    
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        cellTopView.x = 0
        cellTopView.y = 0
        cellTopView.width = self.contentView.width
        cellTopView.height = CGFloat(55)
        
        
        cellbottomView.height = 44
        cellbottomView.width = self.contentView.width
        cellbottomView.x = 0
        cellbottomView.y = self.contentView.height - cellbottomView.height
        
        text_label.x = cellTopView.profileImageView.x
        text_label.y = CGRectGetMaxY(cellTopView.frame)
        text_label.width = UIScreen.mainScreen().bounds.size.width - 4*XJTopicCellMargin
        text_label.height = topic.xj
       
            
            
        
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




























