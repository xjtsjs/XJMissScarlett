//
//  XJTextField.swift
//  XJMissScarlett
//
//  Created by xj on 7/31/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

class XJTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clearButtonMode = .WhileEditing
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func becomeFirstResponder() -> Bool {
        self.setValue(self.textColor, forKeyPath: "_placeholderLabel.textColor")
        return super.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool {
        self.setValue(UIColor.grayColor(), forKeyPath: "_placeholderLabel.textColor")
        return super.resignFirstResponder()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

















