//
//  String+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation

extension String {
    
    /// 获取url 参数
    ///
    /// - Parameter name: 参数名
    /// - Returns: 参数值
    func url(name: String) -> String? {
        // 0. 截取字符串
        var content = self
        if contains("?") {
            content = components(separatedBy: "?").last!
        }
        // 1. 判断参数个数
        if contains("&") {
            // 1.1 获取参数数组
            let params = content.components(separatedBy: "&")
            for item in params {
                // 1.2 获取 key value
                let array = item.components(separatedBy: "=")
                // 1.3 移除百分号编码
                let key = array.first?.removingPercentEncoding
                let value = array.last?.removingPercentEncoding
                if key == name {
                    return value
                }
            }
            return nil
        } else {
            // 2.0 获取 键值对
            let array = content.components(separatedBy: "=")
            // 2.1 移除百分号编码
            let key = array.first?.removingPercentEncoding
            let value = array.last?.removingPercentEncoding
            if key == name {
                return value
            }
            return nil
        }
    }
}
