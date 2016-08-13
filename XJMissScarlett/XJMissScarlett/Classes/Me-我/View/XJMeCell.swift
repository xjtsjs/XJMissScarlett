//
//  XJMeCell.swift
//  XJMissScarlett
//
//  Created by xj on 8/12/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJMeCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .DisclosureIndicator
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "mainCellBackground")
        self.backgroundView = bgImageView
        self.textLabel?.textColor = UIColor.darkGrayColor()
        self.textLabel?.font = UIFont.systemFontOfSize(16)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.imageView?.image == nil {
            return
        }
        self.imageView?.width = 30
        self.imageView?.height = self.imageView!.width
        self.imageView?.center.y = self.contentView.height/2
        self.textLabel?.x = CGRectGetMaxX(self.imageView!.frame) + XJTopicCellMargin
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}



















