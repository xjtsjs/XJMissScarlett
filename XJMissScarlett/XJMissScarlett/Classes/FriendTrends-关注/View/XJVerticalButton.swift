//
//  XJVerticalButton.swift
//  XJMissScarlett
//
//  Created by xj on 7/31/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJVerticalButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setup() -> Void {
        self.titleLabel?.textAlignment = .Center
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.x = 0
        self.imageView?.y = 0
        self.imageView?.width = self.width
        self.imageView?.height = self.imageView!.width
        
        self.titleLabel?.x = 0
        self.titleLabel?.y = self.imageView!.height
        self.titleLabel?.width = self.width
        self.titleLabel?.height = self.height - self.titleLabel!.y + 5
        
    }
}
