//
//  XJGRecommendUserCell.swift
//  XJMissScarlett
//
//  Created by xj on 7/30/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJRecommendUserCell: UITableViewCell {
    var user = XJRecommendUser(){
        didSet{
            screenNameLabel.text = user.screen_name
            fansCountLabel.text = "\(user.fans_count)关注"
            headerImageView.sd_setImageWithURL(NSURL(string: user.header), placeholderImage: UIImage(named: "defaultUserIcon"))
        }
    
    }
    var headerImageView = UIImageView()
    var screenNameLabel = UILabel()
    var fansCountLabel = UILabel()
    var attentionButton = UIButton(type: .Custom)
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(headerImageView)
        headerImageView.layer.cornerRadius = (self.height/1.5)/2
        headerImageView.layer.masksToBounds = true
        self.contentView.addSubview(screenNameLabel)
        screenNameLabel.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(fansCountLabel)
        fansCountLabel.font = UIFont.systemFontOfSize(12)
        fansCountLabel.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(attentionButton)
        attentionButton.setTitle("+ 关注", forState: .Normal)
        attentionButton.titleLabel?.font = UIFont.systemFontOfSize(14)
        attentionButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        attentionButton.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        attentionButton.setBackgroundImage(UIImage(named: "FollowBtnBg"), forState: .Normal)
        attentionButton.setBackgroundImage(UIImage(named: "FollowBtnClickBg"), forState: .Highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.width = self.height/1.5
        headerImageView.height = headerImageView.width
        headerImageView.x = 8
        headerImageView.y = (self.height - headerImageView.width)/2
        
        screenNameLabel.x = CGRectGetMaxX(headerImageView.frame) + 5
        screenNameLabel.y = headerImageView.y
        screenNameLabel.width = self.width/2
        screenNameLabel.height = headerImageView.height/2
        
        
        fansCountLabel.x = screenNameLabel.x
        fansCountLabel.y = self.height/2 + 5
        fansCountLabel.width = screenNameLabel.width
        fansCountLabel.height = screenNameLabel.height
        
        attentionButton.width = 44
        attentionButton.height = self.height/2
        attentionButton.x = self.width - 8 - attentionButton.width
        attentionButton.y = self.height/4
    }
    
    
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}






















