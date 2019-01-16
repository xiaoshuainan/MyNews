//
//  HomeTableViewController.swift
//  MyNews
//
//  Created by xsn on 2019/1/15.
//  Copyright © 2019年 XXX. All rights reserved.
//

import UIKit
import SVProgressHUD
import BMPlayer
import MJRefresh

class HomeTableViewController: UITableViewController {
    /// 懒加载播放器
    lazy var player: BMPlayer = BMPlayer(customControlView: VideoPlayerCustomView())
    /// 标题
    var newsTitle = HomeNewsTitle()
    /// 新闻数据
    var news = [NewsModel]()
    /// 刷新时间
    var maxBehotTime: TimeInterval = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// 设置刷新控件
    func setupRefresh(with category: NewsTitleCategory = .recommend) {
        // 初始化刷新头部
        let header = RefreshHeader {
        }
        /** 根据拖拽比例自动切换透明度 */
        header?.isAutomaticallyChangeAlpha = true
        // 设置上次刷新的时间
        header?.lastUpdatedTimeLabel.isHidden = true
        
        //为tableView设置头部刷新
        tableView.mj_header = header
        tableView.mj_header.beginRefreshing()
        
        // 初始化底部刷新
        tableView.mj_footer = RefreshAutoGifFooter(refreshingBlock: {
//            [weak self] in
            
        })
        tableView.mj_footer.isAutomaticallyChangeAlpha = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
