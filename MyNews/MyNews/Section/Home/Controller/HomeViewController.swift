//
//  HomeViewController.swift
//  MyNews
//
//  Created by xsn on 2018/12/27.
//  Copyright © 2018年 XXX. All rights reserved.
//

import UIKit
import SGPagingView
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    /// 标题
    private var pageTitleView: SGPageTitleView?
    /// 内容
    private var pageContentView: SGPageContentScrollView?
    /// 自定义导航栏
    private lazy var navigationBar = HomeNavigationView.loadViewFromNib()
    private lazy var disposeBag = DisposeBag()
    /// 添加频道按钮
    private lazy var addChannelButton: UIButton = {
        let addChannelButton = UIButton(frame: CGRect(x: screenWidth - newsTitleHeight, y: 0, width: newsTitleHeight, height: newsTitleHeight))
        addChannelButton.theme_setImage("images.add_channel_titlbar_thin_new_16x16_", forState: .normal)
        let separatorView = UIView(frame: CGRect(x: 0, y: newsTitleHeight - 1, width: newsTitleHeight, height: 1))
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        return addChannelButton
    }()
    
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
        //初始化UI
        setupUI()
    }
    
}

extension HomeViewController {
    
    /// 初始化UI
    private func setupUI() {
        view.theme_backgroundColor = "colors.cellBackgroundColor"
        // 自定义导航栏
        navigationItem.titleView = navigationBar
        // 添加频道按钮
        view.addSubview(addChannelButton)
        
        // 首页顶部新闻标题的数据
        NetworkTool.loadHomeNewsTitleData {
            // 向数据库中插入数据
//            NewsTitleTable().insert($0)
            let configuration = SGPageTitleViewConfigure()
            configuration.titleColor = .black
            configuration.titleSelectedColor = .globalRedColor()
            configuration.indicatorColor = .clear
            // 标题名称的数组
            print("数组:", $0)
            let nameArray: NSArray = $0.compactMap({ $0.name }) as NSArray
            print(nameArray)
            self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: 0, width: screenWidth - newsTitleHeight, height: newsTitleHeight), delegate: self, titleNames: $0.compactMap({ $0.name }), configure: configuration)
            self.pageTitleView!.backgroundColor = .clear
            self.view.addSubview(self.pageTitleView!)
            // 设置子控制器
            _ = $0.compactMap({ (newsTitle) -> () in
                switch newsTitle.category {
                case .video:            // 视频
                    let videoTableVC = VideoTableViewController()
//                    videoTableVC.bgColor = UIColor.orange
//                    videoTableVC.newsTitle = newsTitle
//                    videoTableVC.setupRefresh(with: .video)
                    self.addChild(videoTableVC)
                case .essayJoke:        // 段子
                    let videoTableVC = ViewController()
                    videoTableVC.bgColor = UIColor.cyan
                    self.addChild(videoTableVC)
                case .imagePPMM:        // 街拍
                    let videoTableVC = ViewController()
                    self.addChild(videoTableVC)
                case .imageFunny:        // 趣图
                    let videoTableVC = ViewController()
                    self.addChild(videoTableVC)
                case .photos:           // 图片,组图
                    let videoTableVC = ViewController()
                    self.addChild(videoTableVC)
                case .jinritemai:       // 特卖
                    let videoTableVC = ViewController()
                    self.addChild(videoTableVC)
                default :
                    let homeTableVC = ViewController()
//                    homeTableVC.setupRefresh(with: newsTitle.category)
                    self.addChild(homeTableVC)
                }
            })
            //内容
            self.pageContentView = SGPageContentScrollView(frame: CGRect(x: 0, y: newsTitleHeight, width: screenWidth, height: self.view.frame.height - newsTitleHeight), parentVC: self, childVCs: self.children)
            self.pageContentView!.delegatePageContentScrollView = self
            self.view.addSubview(self.pageContentView!)
        }
    }
}

// MARK: - SGPageTitleViewDelegate
extension HomeViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentView!.setPageContentScrollViewCurrentIndex(selectedIndex)
    }

    /// 联动 SGPageTitleView 的方法
    func pageContentScrollView(_ pageContentScrollView: SGPageContentScrollView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.pageTitleView!.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
