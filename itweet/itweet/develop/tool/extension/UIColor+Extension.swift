//
//  UIColor+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit

// MARK: - UIColor extension
extension UIColor {
    
    /// 随即色
    class var random: UIColor {
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    /// 便利构造器（hex）
    ///
    /// - Parameter hex: hex string
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
    
    /// 便利构造器(hex, alpha)
    ///
    /// - Parameters:
    ///   - hex: 二进制字符串
    ///   - alpha: 透明度
    convenience init(hex: String, alpha: CGFloat) {
        // 0. 改变属性
        var hex = hex
        // 1. 截取字符串
        while hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
        }
        // 2. 判断合法性
        if hex.count != 6 {
            // 2.1 提示
            print(tramp: "Please check your hex string for UIColor")
            // 2.2 补全
            while hex.count != 6 {
                hex.append("0")
            }
        }
        // 3. scanner
        let scanner = Scanner.init(string: hex)
        // 3.1 设置扫描位置
        scanner.scanLocation = 0
        // 3.2 存储指针
        var rgbValue: UInt64 = 0
        // 3.3 扫描 hex
        scanner.scanHexInt64(&rgbValue)
        // 3.4 位移操作
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        // 4. 生成 颜色
        self.init(red: CGFloat(r) / 0xff, green: CGFloat(g) / 0xff, blue: CGFloat(b) / 0xff, alpha: alpha)
    }
}
