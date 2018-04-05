//
//  LoginController.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginController: TRViewController {
    // MARK: - 生命周期 -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // 1. 初始化
        initUi()
    }
    
    // MARK: - 懒加载属性 -
    
    /// rightBarButtonItem
    private lazy var rightBarButtonItem = UIBarButtonItem.init(title: "自动填充",
                                                               color: UIColor.init(hex: "#FF7F50"),
                                                               font: 16,
                                                               target: self,
                                                               action: #selector(autoFill))
    
    /// leftBarButtonItem
    private lazy var leftBarButtonItem = UIBarButtonItem.init(title: "刷新",
                                                              color: UIColor.init(hex: "#FF7F50"),
                                                              font: 16,
                                                              target: self,
                                                              action: #selector(reloadAuthorize))
    
    /// web view
    private lazy var webView: UIWebView = {
        // 1. 创建webview
        let web = UIWebView.init(frame: CGRect.zero)
        // 2. 设置代理
        web.delegate = self
        // 3. 加载地址
        web.loadRequest(URLRequest.init(url: URL.init(string: TR_SINA_AUTHORIZE)!))
        // 4. 返回
        return web
    }()
    
}

// MARK: - 响应方法
extension LoginController {
    
    /// 自动填充
    @objc private func autoFill() {
        let account = "document.getElementById(\"userId\").value = \"wg_workshop@outlook.com\";"
        let password = "document.getElementById(\"passwd\").value = \"Wg18232580294\";"
        webView.stringByEvaluatingJavaScript(from: account + password)
    }
    
    /// 重新加载页面
    @objc private func reloadAuthorize(){
        webView.reload()
    }
}


// MARK: - UIWebViewDelegate
extension LoginController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        // 1. 开启加载动画
        SVProgressHUD.show(status: "正在加载授权")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        // 1. 结束动画
        SVProgressHUD.dismiss()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 1. 结束动画
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if let url = request.url, url.host == "www.baidu.com",
            let query = url.query, query.contains("code=") {
            query.url(name: "code")
            return false
        } else {
            return true
        }
    }
}

// MARK: - 初始化
extension LoginController {
    
    /// 初始化Ui
    private func initUi() {
        // 0. 导航栏
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        // 1. web view
        view.addSubview(webView)
        webView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}
