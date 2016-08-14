//
//  XJTopic.swift
//  XJMissScarlett
//
//  Created by xj on 8/2/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTopic: NSObject {
    var name = ""
    var profile_image = ""
    var create_time = ""
    var text = ""
    var ding = 0
    var cai = 0
    var repost = 0
    var comment = 0
    var width = CGFloat(0)
    var height = CGFloat(0)
    var small_image = ""
    var middle_image = ""
    var large_image = ""
    var type = 0
    var voicetime = 0
    var playcount = 0
    var videotime = 0
    var videouri = ""
    var voiceuri = ""
    
    var pictureProgress = CGFloat(0)
    var voiceF = CGRectMake(0, 0, 0, 0)
    var videoF = CGRectMake(0, 0, 0, 0)
    
    
    
    
    //额外的辅助属性
    lazy var cellHeight:CGFloat = {
        let maxSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width - 4*XJTopicCellMargin, CGFloat(MAXFLOAT))
        let textH = (self.text as NSString).boundingRectWithSize(maxSize, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil).size.height
        self.xj = textH
        var height = XJTopicCellTextY + textH + XJTopicCellMargin
        
        if(self.type == XJTopicType.Picture.rawValue){
            let pictureW = maxSize.width
            var pictureH = pictureW * self.height/self.width
            if pictureH >= XJTopicCellPictureMaxH{
                pictureH = XJTopicCellPictureBreakH
                self.bigPicture = true
            
            }
            let pictureX = XJTopicCellMargin
            let pictureY = XJTopicCellTextY + textH + XJTopicCellMargin
            self.pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH)
            height += pictureH + XJTopicCellMargin
            
        }else if (self.type == XJTopicType.Voice.rawValue){
            let voiceX = XJTopicCellMargin
            let voiceY = XJTopicCellTextY + textH + XJTopicCellMargin
            let voiceW = maxSize.width
            let voiceH = voiceW*self.height/self.width
            self.voiceF = CGRectMake(voiceX, voiceY, voiceW, voiceH)
            height += voiceH + XJTopicCellMargin
        }else if (self.type == XJTopicType.Video.rawValue) {
            let videoX = XJTopicCellMargin
            let videoY = XJTopicCellTextY + textH + XJTopicCellMargin
            let videoW = maxSize.width
            let videoH = videoW*self.height/self.width
            self.videoF = CGRectMake(videoX, videoY, videoW, videoH)
            height += videoH + XJTopicCellMargin
            
        
        }
            height += XJTopicCellBottomBarH + XJTopicCellMargin
        return height
    }()
    var pictureF = CGRectMake(0, 0, 0, 0)
    var xj = CGFloat(0)
    var bigPicture = false
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        if key == "image0" {
            self.small_image = value as! String
        }
        if key == "image1" {
            self.large_image = value as! String
        }
        if key == "image2" {
            self.middle_image = value as! String
        }
    }
    
    
    
    
    
}















