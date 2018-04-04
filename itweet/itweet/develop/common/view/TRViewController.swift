//
//  TRViewController.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit

class TRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 1. init Ui
        initUi()
    }
    
}

extension TRViewController {
    
    /// init ui
    private func initUi(){
        // 1. 背景色
        view.backgroundColor = UIColor.white
    }
}
