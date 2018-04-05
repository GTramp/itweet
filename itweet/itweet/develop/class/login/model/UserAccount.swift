//
//  UserAccount.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    // MARK: - 开放属性 -
    /// 用户授权的唯一票据
    @objc var access_token: String?
    /// access_token的生命周期，单位是秒数。
    @objc var expires_in: Int = -1
    /// 授权用户的UID
    @objc var uid: Int = -1
    ///
    @objc var isRealName: Bool = false
    
    
    override var description: String {
        let keys = ["access_token","expires_in","uid","isRealName"]
        return dictionaryWithValues(forKeys: keys).description
    }
    
    
    // MARK: - KVC -
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

extension UserAccount {
    
    /// 字典转模型
    ///
    /// - Parameter dict: 字典数据
    convenience init(dict:[String: Any]) {
        self.init()
        setValuesForKeys(dict)
    }
}
