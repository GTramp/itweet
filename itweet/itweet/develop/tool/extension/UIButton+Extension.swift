//
//  UIButton+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// UIButton （便利构造器）
    ///
    /// - Parameters:
    ///   - normalImage: normal image
    ///   - highlightedImage:  highlighted Image
    ///   - normalBackground: normal Background
    ///   - highlightedBackground: highlighted Background
    ///   - target: target
    ///   - action: action
    convenience init(normalImage: UIImage?,
                     highlightedImage: UIImage?,
                     normalBackground: UIImage?,
                     highlightedBackground: UIImage?,
                     target: Any?,
                     action: Selector?
        ) {
        self.init(type: UIButtonType.custom)
        
        if let normalImage = normalImage {
            setImage(normalImage, for: UIControlState.normal)
        }
        
        if let highlightedImage = highlightedImage {
            setImage(highlightedImage, for: UIControlState.highlighted)
        }
        
        if let normalBackground = normalBackground {
            setBackgroundImage(normalBackground, for: UIControlState.normal)
        }
        
        if let highlightedBackground = highlightedBackground {
            setBackgroundImage(highlightedBackground, for: UIControlState.highlighted)
        }
        
        if let target = target , let action = action {
            addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        }
        
        sizeToFit()
    }
}
