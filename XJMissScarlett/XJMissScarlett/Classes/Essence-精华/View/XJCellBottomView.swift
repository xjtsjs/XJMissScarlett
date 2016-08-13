//
//  XJCellBottom.swift
//  XJMissScarlett
//
//  Created by xj on 8/3/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJCellBottomView: UIView {

    var dingButton = UIButton()
    var caiButton = UIButton()
    var shareButton = UIButton()
    var commentButton = UIButton()
    var marginImageView = UIImageView()
    var leftImageView = UIImageView()
    var rightImageView = UIImageView()
    var middleImageView = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.addSubview(dingButton)
        dingButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        dingButton.setImage(UIImage(named: "mainCellDing"), forState: .Normal)
        dingButton.setImage(UIImage(named: "mainCellDingClick"), forState: .Highlighted)
        dingButton.setTitle("555", forState: .Normal)
        dingButton.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.addSubview(caiButton)
        caiButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        caiButton.setImage(UIImage(named: "mainCellCai"), forState: .Normal)
        caiButton.setImage(UIImage(named: "mainCellCaiClick"), forState: .Highlighted)
        caiButton.setTitle("555", forState: .Normal)
        caiButton.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.addSubview(shareButton)
        shareButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        shareButton.setImage(UIImage(named: "mainCellShare"), forState: .Normal)
        shareButton.setImage(UIImage(named: "mainCellShareClick"), forState: .Highlighted)
        shareButton.setTitle("555", forState: .Normal)
        shareButton.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.addSubview(commentButton)
        commentButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        commentButton.setImage(UIImage(named: "mainCellComment"), forState: .Normal)
        commentButton.setImage(UIImage(named: "mainCellCommentClick"), forState: .Highlighted)
        commentButton.setTitle("555", forState: .Normal)
        commentButton.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.addSubview(marginImageView)
        marginImageView.image = UIImage(named: "cell-content-line")
        middleImageView.contentMode = .Center
        self.addSubview(leftImageView)
        leftImageView.image = UIImage(named: "cell-button-line")
        leftImageView.contentMode = .Center
        self.addSubview(middleImageView)
        middleImageView.image = UIImage(named: "cell-button-line")
        middleImageView.contentMode = .Center
        self.addSubview(rightImageView)
        rightImageView.image = UIImage(named: "cell-button-line")
        rightImageView.contentMode = .Center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.width/4
        
        dingButton.width = width
        dingButton.x = 0
        dingButton.y = 0
        dingButton.height = self.height
        
        caiButton.width = width
        caiButton.x = width
        caiButton.y = 0
        caiButton.height = self.height
        
        shareButton.width = width
        shareButton.x = 2*width
        shareButton.y = 0
        shareButton.height = self.height
        
        commentButton.y = 0
        commentButton.x = 3*width
        commentButton.width = width
        commentButton.height = self.height
        
        marginImageView.width = self.width
        marginImageView.height = 1
        marginImageView.x = 0
        marginImageView.y = 0
        
        leftImageView.height = self.height
        leftImageView.width = 1
        leftImageView.x = width
        leftImageView.y = 0
        
        middleImageView.height = self.height
        middleImageView.width = 1
        middleImageView.x = 2*width
        middleImageView.y = 0
        
        rightImageView.height = self.height
        rightImageView.width = 1
        rightImageView.x = 3*width
        rightImageView.y = 0
    }

}
