//
//  XJTopicCellTop.swift
//  XJMissScarlett
//
//  Created by xj on 8/3/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJCellTopView: UIView {

    var profileImageView = UIImageView()
    var nameLabel = UILabel()
    var createTimeLabel = UILabel()
    var followButton = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(profileImageView)
        profileImageView.layer.cornerRadius = 35/2
        profileImageView.layer.masksToBounds = true
        self.addSubview(nameLabel)
        nameLabel.font = UIFont.systemFontOfSize(13)
        nameLabel.textColor = UIColor.darkGrayColor()
        self.addSubview(createTimeLabel)
        createTimeLabel.font = UIFont.systemFontOfSize(10)
        createTimeLabel.textColor = UIColor.darkGrayColor()
        self.addSubview(followButton)
        followButton.setBackgroundImage(UIImage(named: "cellFollowIcon"), forState: .Normal)
        followButton.setBackgroundImage(UIImage(named: "cellFollowClickIcon"), forState: .Highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.x = XJCellmargin
        profileImageView.y = XJCellmargin
        profileImageView.size = CGSizeMake(35, 35)
        
        nameLabel.x = CGRectGetMaxX(profileImageView.frame) + XJCellmargin
        nameLabel.y = profileImageView.y
        nameLabel.width = self.width/2
        nameLabel.height = CGFloat(18)
        
        createTimeLabel.height = CGFloat(15)
        createTimeLabel.width = nameLabel.width
        createTimeLabel.x = nameLabel.x
        createTimeLabel.y = CGRectGetMaxY(nameLabel.frame) + 2
        
        followButton.size = followButton.currentBackgroundImage!.size
        followButton.x = self.width - followButton.width - XJCellmargin
        followButton.y = XJCellmargin
        
        
    }
}
















