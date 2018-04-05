//
//  MainController.swift
//  itweet
//
//  Created by tramp on 2018/4/4.
//  Copyright © 2018年 tramp. All rights reserved.
//

import UIKit

class MainController: TRTabBarController {
    // MARK: - 生命周期 -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 1. 配置
        configure()
    }
    
}

// MARK: - 初始化
extension MainController {
    
    /// 配置
    private func configure(){
        // 1. 获取json 文件
        guard let filePath = Bundle.filePath(name: "configure.json") ,
            let data = NSData.init(contentsOfFile: filePath) as Data?,
            let items = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Array<[String:String]>
            else { return  }
        // 2. 遍历 数组
        for item in items {
            let controller =  initChildController(dict: item)
            addChildViewController(controller)
        }
    }
    
    /// 初始化子控制器
    ///
    /// - Parameter dict: 字典参数
    private func initChildController(dict: [String: String])-> UIViewController {
        // 1. 获取参数
        guard let title = dict["title"],
            let image = dict["image"],
            let cls = dict["class"],
            let _class = NSClassFromString("\(Bundle.main.nameSpace).\(cls)") as? TRViewController.Type
            else {return TRViewController.init()}
        // 2. 创建控制器
        let rootVC = _class.init()
        // 3. 预设
        rootVC.title = title
        rootVC.tabBarItem.title = title
        rootVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.init(hex: "#696969")],
                                                 for: UIControlState.selected)
        rootVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.init(hex: "#696969")],
                                                 for: UIControlState.normal)
        rootVC.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        rootVC.tabBarItem.selectedImage = UIImage.init(named: "\(image)_selected")?.withRenderingMode(.alwaysOriginal)
        // 4. 包装导航控制器
        let controller = TRNavigationController.init(rootViewController:rootVC)
        // 5. 返回
        return controller
    }
}
