//
//  Print.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation

/// 自定义控制台打印
///
/// - Parameters:
///   - tramp: 打印内容
///   - file: 文件名
///   - method: 方法名
///   - line: 行号
func print<T>(tramp: T, file: String = #file, method: String = #function, line:Int = #line) {
    #if DEBUG
    let fileName = ((file as NSString).pathComponents.last!)
    print("tramp=> \(fileName).\(method)[\(line)]: \(tramp)")
    #endif
}
