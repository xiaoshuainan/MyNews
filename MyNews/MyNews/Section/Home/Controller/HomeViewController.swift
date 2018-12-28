//
//  HomeViewController.swift
//  MyNews
//
//  Created by xsn on 2018/12/27.
//  Copyright © 2018年 XXX. All rights reserved.
//

import UIKit
import SGPagingView

class HomeViewController: UIViewController {
    /// 标题
    private var pageTitleView: SGPageTitleView?
    /// 内容
    private var pageContentView: SGPageContentScrollView?
    /// 自定义导航栏
    var navigationBar = Bundle.main.loadNibNamed("HomeNavigationView", owner: nil, options: nil)?.first as! HomeNavigationView
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.keyWindow?.theme_backgroundColor = "colors.windowColor"
        //设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background" + (UserDefaults.standard.bool(forKey: isNight) ? "_night" : "")), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
}

extension HomeViewController {
    private func setupUI() {
        view.theme_backgroundColor = "colors.cellBackgroundColor"
        navigationItem.titleView = navigationBar
    }
}
