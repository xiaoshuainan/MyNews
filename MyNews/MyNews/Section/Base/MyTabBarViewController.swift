//
//  MyTabBarViewController.swift
//  MyNews
//
//  Created by xsn on 2018/12/26.
//  Copyright © 2018年 XXX. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.theme_tintColor = "colors.tabbarTintColor"
        tabBar.theme_barTintColor = "colors.cellBackgroundColor"
        //添加子控制器
        addChildViewControllers()
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home")
        setChildViewController(ViewController(), title: "西瓜视频", imageName: "video")
        setPublishViewController(ViewController(), title: "", imageName: "feed_publish")
        setChildViewController(ViewController(), title: "小视频", imageName: "huoshan")
        setChildViewController(ViewController(), title: "我的", imageName: "mine")
    }
    
    /// 初始化发布按钮
    private func setPublishViewController(_ childController: UIViewController, title: String, imageName: String) {
        //设置tabBar文字与图片
        if UserDefaults.standard.bool(forKey: isNight) {
            //夜间
            childController.tabBarItem.image = UIImage(named: imageName + "_night_44x44_")
            childController.tabBarItem.selectedImage = UIImage(named: imageName + "_press_night_44x44_")
        } else {
            //日间
            childController.tabBarItem.image = UIImage(named: imageName + "_44x44_")
            childController.tabBarItem.selectedImage = UIImage(named: imageName + "_press_44x44_")
        }
        childController.title = title
        addChild(MyNavigationController(rootViewController: childController))
    }
    
    /// 初始化控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        //设置tabBar文字与图片
        if UserDefaults.standard.bool(forKey: isNight) {
            //夜间
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            //日间
            setDayChildController(controller: childController, imageName: imageName)
        }
        childController.title = title
        addChild(MyNavigationController(rootViewController: childController))
    }
    
    /// 设置夜间控制器
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    /// 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
