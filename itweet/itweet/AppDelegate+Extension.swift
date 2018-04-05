//
//  AppDelegate+extension.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit
import SVProgressHUD
import SnapKit

// MARK: - AppDelegate Extension
extension AppDelegate {
    
    /// 配置
    func configure() {
        // 1. 初始化窗口
        initWindow()
    }
    
    /// 初始化窗口
    private func initWindow(){
        // 1. 初始化窗口
        window = UIWindow.init(frame: UIScreen.tr_bounds)
        // 2. 设置root controller
        window?.rootViewController = MainController.init()
        // 3. 设置为主窗口并且可见
        window?.makeKeyAndVisible()
    }

}

