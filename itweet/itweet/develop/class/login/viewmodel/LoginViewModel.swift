//
//  LoginViewModel.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation

/// loginviewmodel
class LoginViewModel {
    
    // MARK: - 开放属性 -
    
    /// 用户登录状态
    var isLogan: Bool = false
    /// 账户信息
    var userAccount: UserAccount?
    
    /// 单例对象
    static let shared = LoginViewModel()
    // 禁用 API
    private init(){}
}
