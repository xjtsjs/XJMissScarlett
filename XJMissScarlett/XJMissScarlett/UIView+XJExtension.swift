//
//  XJ_UIView.swift
//  XJMissScarlett
//
//  Created by xj on 7/29/16.
//  Copyright © 2016 xj. All rights reserved.
//

import UIKit

extension UIView{
    var width:CGFloat{
        set{self.frame.size.width = newValue}
        get{return self.frame.size.width}
    }
    var height:CGFloat{
        set{self.frame.size.height = newValue}
        get{return self.frame.size.height}
    }
    var x:CGFloat{
        set{self.frame.origin.x = newValue}
        get{return self.frame.origin.x}
    }
    var y:CGFloat{
        set{self.frame.origin.y = newValue}
        get{return self.frame.origin.y}
    }
    var size:CGSize{
        set{self.frame.size = newValue}
        get{return self.frame.size}
    }
    
}
