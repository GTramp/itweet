//
//  SDK.swift
//  itweet
//
//  Created by tramp on 2018/4/5.
//  Copyright © 2018年 tramp. All rights reserved.
//

import Foundation

// MARK: - sina -
/// app key
let TR_SINA_APP_KEY = "3694779693"
/// app secret
let TR_SINA_APP_SECRET = "b73d00ac1c2ff074722f65acda7ca04a"
/// client_id
let TR_SINA_CLIENT_ID = TR_SINA_APP_KEY
/// redirect_uri
let TR_SINA_REDIRECT_URI = "https://www.baidu.com/"
/// scope
let TR_SINA_SCOPE = "all"
/// state
let TR_SINA_STATE = "tramp"
/// display
let TR_SINA_DISPLAY = "default"
/// forcelogin
let TR_SINA_FORCELOGIN = false
/// language
let TR_SINA_LANGUAGE = "zh"
/// oauth2/authorize
let TR_SINA_AUTHORIZE = "https://api.weibo.com/oauth2/authorize?client_id=\(TR_SINA_CLIENT_ID)&redirect_uri=\(TR_SINA_REDIRECT_URI)&response_type=code&state=\(TR_SINA_STATE)"
