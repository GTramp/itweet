//
//  UIScreen+extension.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit

// MARK: - UIScreen Extension
extension UIScreen {
    
    /// 屏幕size
    class var tr_size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// 屏幕bounds
    class var tr_bounds: CGRect {
        return UIScreen.main.bounds
    }
    
    /// 屏幕高度
    class var tr_height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// 屏幕宽度
    class var tr_width: CGFloat {
        return UIScreen.main.bounds.width
    }
}
