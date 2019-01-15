//
//  Constant.swift
//  MyNews
//
//  Created by xsn on 2018/12/26.
//  Copyright © 2018年 XXX. All rights reserved.
//

import UIKit

/// 屏幕的宽度
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
let screenHeight = UIScreen.main.bounds.height

/// 服务器地址
let BASE_URL = "https://is.snssdk.com"

let device_id: Int = 6096495334
let iid: Int = 5034850950

/// 视图的x y w h
func x(object: UIView) -> CGFloat {
    return object.frame.origin.x
}
func y(object: UIView) -> CGFloat {
    return object.frame.origin.y
}
func w(object: UIView) -> CGFloat {
    return object.frame.width
}
func h(object: UIView) -> CGFloat {
    return object.frame.height
}

/// 添加频道的宽高
let newsTitleHeight: CGFloat = 40.0


/// 夜景
let isNight = "isNight"
