//
//  UIBarButtonItem+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit

// MARK: - UIBarButtonItem extension
extension UIBarButtonItem {
    
    /// 便利构造器（title）
    ///
    /// - Parameters:
    ///   - title: 标题内容
    ///   - color: 标题颜色
    ///   - target: 响应者
    ///   - action: 响应方法
    convenience init(title: String, color: UIColor, font: CGFloat, target: Any?, action: Selector?) {
        // 1. 创建button
        let button = UIButton.init(type: UIButtonType.custom)
        // 2. 设置title
        button.setTitle(title, for: UIControlState.normal)
        button.setTitleColor(color, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: font)
        // 3. 自适应大小
        button.sizeToFit()
        // 4. 添加事件
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        }
        // 5. 初始化
        self.init(customView: button)
    }
}
