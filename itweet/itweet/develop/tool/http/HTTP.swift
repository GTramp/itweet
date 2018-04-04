//
//  HTTP.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation
import Alamofire

/// 请求类型
///
/// - POST: POST 请求
/// - GET: GET 请求
enum HTTP_TYPE {
    case POST
    case GET
}

/// http 网络请求
class HTTP {
    /// 单利对象
    static let shared = HTTP()
    /// 禁用api
    private init(){}
    
    /// 网络请求
    ///
    /// - Parameters:
    ///   - type: 请求类型
    ///   - url: 请求地址
    ///   - params: 请求参数
    ///   - completionHandler: 完成回调
    func request(type: HTTP_TYPE, url: URLConvertible,  params:[String: Any]?, completionHandler:@escaping((_ isSucceed: Bool, _ resp: Any?)->())){
        // 1. 方法类型
        let method: HTTPMethod = type == HTTP_TYPE.POST ? HTTPMethod.post : HTTPMethod.get
        // 2. 网络请求
        Alamofire.request(url,
                          method: method,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: nil).responseJSON { (dataResponse) in
                            dataResponse.result.isSuccess ? completionHandler(true,dataResponse.data) : completionHandler(false, nil)
        }
    }
}



