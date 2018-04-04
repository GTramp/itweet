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
    
    /// web view
    private lazy var webView: UIWebView = {
        // 1. 创建webview
        let web = UIWebView.init(frame: CGRect.zero)
        // 2. 设置代理
        web.delegate = self
        // 3. 加载地址
        web.loadRequest(URLRequest.init(url: URL.init(string: "https://www.baidu.com/")!))
        return web
    }()

}

// MARK: - UIWebViewDelegate
extension LoginController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        // 1. 开启加载动画
        SVProgressHUD.show(info: "正在加载授权页面...")
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
        print(request)
        return true
    }
}

extension LoginController {
    
    /// 初始化Ui
    private func initUi() {
        // 1. web view
        view.addSubview(webView)
        webView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}
