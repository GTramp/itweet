//
//  SVProgressHUD+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation
import SVProgressHUD

// MARK: - SVProgressHUD Extension
extension SVProgressHUD {
    
    /// 延时消失
    ///
    /// - Parameter delay: 延时
    class func dismiss(delay: TimeInterval) {
        self.dismiss(withDelay: delay)
    }
    
    /// 展示图片信息
    ///
    /// - Parameters:
    ///   - image: 图片信息
    ///   - status: 文本信息
    ///   - duration: 展示周期
    class func show(image: UIImage, status: String, duration: TimeInterval) {
        show(image: image, status: status)
        dismiss(delay: duration)
    }
    
    /// 展示图图片信息
    ///
    /// - Parameters:
    ///   - image: 图片信息
    ///   - status: 文本信息
    class func show(image: UIImage, status: String) {
        show(image, status: status)
    }
    
    /// 展示进度
    ///
    /// - Parameter progress: 进度
    class func show(progress: Float) {
        showProgress(progress)
    }
    
    /// 展示成功信息
    ///
    /// - Parameters:
    ///   - success: 信息内容
    ///   - duration: 展示周期
    class func show(success: String, duration: TimeInterval) {
        show(success: success)
        dismiss(delay: duration)
    }
    
    /// 展示成功信息
    ///
    /// - Parameter success: 成功信息内容
    class func show(success: String) {
        showSuccess(withStatus: success);
    }
    
    /// 展示错误信息
    ///
    /// - Parameters:
    ///   - error: 错误信息
    ///   - duration: 展示周期
    class func show(error: String, duration: TimeInterval) {
        show(error: error)
        dismiss(delay: duration)
    }
    
    /// 展示错误信息
    ///
    /// - Parameter error: 错误信息
    class func show(error: String) {
        showError(withStatus: error)
    }
    
    /// 展示信息
    ///
    /// - Parameters:
    ///   - info: 信息内容
    ///   - duration: 展示周期
    class func show(info: String, duration: TimeInterval) {
        show(info: info)
        dismiss(delay: duration)
    }
    
    /// 展示信息
    ///
    /// - Parameter info: 信息内容
    class func show(info: String) {
        showInfo(withStatus: info)
    }
}
