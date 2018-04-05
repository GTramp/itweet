//
//  HTTP+Extension.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation

extension HTTP {
    
    /// 获取授权token
    ///
    /// - Parameters:
    ///   - code: code
    ///   - completion: 完成回调
    func loadAccessTokenReq(code: String, completionHandler:@escaping((_ isSucceed: Bool, _ resp: [String: Any]?)->())) {
        // 1. 准备参数
        let params = [
            "client_id": TR_SINA_CLIENT_ID,
            "client_secret": TR_SINA_APP_SECRET,
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": TR_SINA_REDIRECT_URI
        ]
        // 2. 发起网络请求
        request(type: HTTP_TYPE.POST, url: TR_SINA_ACCESS_TOKEN_URI, params: params) { (isSuccess, resp) in
            // 1. 格式转换
            guard let resp = resp as? [String: Any] else {
                // 2. 错误回调
                completionHandler(false, nil)
                return
            }
            // 3. 失败回调
            completionHandler(true, resp)
        }
    }
}
