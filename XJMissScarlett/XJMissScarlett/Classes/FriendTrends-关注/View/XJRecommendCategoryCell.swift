//
//  XJRecommendCategoryCell.swift
//  XJMissScarlett
//
//  Created by xj on 7/30/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJRecommendCategoryCell: UITableViewCell {
    var category = XJRecommendCategory(){
        didSet{
            self.textLabel?.text = category.name
        }
    }
    var selectedIndicator = UIView()
    //
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.XJ_globalBg()
        self.selectedIndicator.backgroundColor = UIColor.XJ_rgbColor(219, g: 21, b: 26, a: 1)
        self.contentView.addSubview(selectedIndicator)
        self.selectionStyle = .None
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.y = 2
        self.textLabel?.height = self.contentView.height - 2 * self.textLabel!.y
        self.selectedIndicator.width = 2
        self.selectedIndicator.height = self.height
        self.selectedIndicator.x = 0
        self.selectedIndicator.y = 0
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectedIndicator.hidden = !selected
        self.textLabel?.textColor = selected ? self.selectedIndicator.backgroundColor:UIColor.XJ_rgbColor(78, g: 78, b: 78, a: 1)
        self.backgroundColor = selected ? UIColor.XJ_rgbColor(244, g: 244, b: 244, a: 1): UIColor.XJ_globalBg()
    }

}

























