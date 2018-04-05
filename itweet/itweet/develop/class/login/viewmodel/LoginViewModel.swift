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


// MARK: - extension
extension LoginViewModel {
    
    /// 加载access token
    ///
    /// - Parameters:
    ///   - code: code
    ///   - completionHandler: 完成回调
    func loadAccessToken(code: String, completionHandler:@escaping ((_ isSucceed: Bool)->())) {
        // 1. 发起网络请求
        HTTP.shared.loadAccessTokenReq(code: code) { (isSucceed, resp) in
            if isSucceed {
                // 2.1 字典转模型
                self.userAccount = UserAccount.init(dict: resp!)
                // 2.2 成功回调
                completionHandler(true)
            } else {
                print(tramp: "网络错误")
                // 3. 错误回调
                completionHandler(false)
            }
        }
    }
}
