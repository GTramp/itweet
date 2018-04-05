//
//  Bundle+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation

extension Bundle {
    
    /// 获取bundle 文件 路径
    ///
    /// - Parameter name: 文件名.*
    /// - Returns: 文件路径
    class func filePath(name: String) -> String? {
        return Bundle.main.path(forResource: name, ofType: nil)
    }
    
    /// 获取命名空间
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
