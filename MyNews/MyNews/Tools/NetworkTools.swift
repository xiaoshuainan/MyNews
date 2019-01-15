//
//  NetworkTools.swift
//  MyNews
//
//  Created by xsn on 2019/1/3.
//  Copyright © 2019年 XXX. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
    //MARK: ------------------------ 首页 home ---------------------
    //MARK: 顶部新闻标题的数据
    static func loadHomeNewsTitleData(completionHandler: @escaping (_ newsTitles: [HomeNewsTitle]) -> ())
    
}

extension NetworkToolProtocol {
    //MARK: ------------------------ 首页 home ---------------------
    
    /// 首页顶部新闻标题的数据
    ///
    /// - Parameter completionHandler: 返回标题数据
    /// - Parameter newsTitles: 首页标题数组
    static func loadHomeNewsTitleData(completionHandler: @escaping (_ newsTitles: [HomeNewsTitle]) -> ()) {
        let url = BASE_URL + "/article/category/get_subscribed/v1/?"
        let params = ["device_id": device_id, "iid": iid]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            //
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else { return }
                if let dataDic = json["data"].dictionary {
                    if let datas = dataDic["data"]?.arrayObject {
                        var titles = [HomeNewsTitle]()
                        titles.append(HomeNewsTitle.deserialize(from: "{\"category\": \"\", \"name\": \"推荐\"}")!)
                        titles += datas.compactMap({
                            HomeNewsTitle.deserialize(from: $0 as? Dictionary)
                        })
                        completionHandler(titles)
                    }
                }
            }
        }
    }
}

struct NetworkTool: NetworkToolProtocol {}
