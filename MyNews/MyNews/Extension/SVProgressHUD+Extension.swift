//
//  SVProgressHUD+Extension.swift
//  MyNews
//
//  Created by xsn on 2019/1/31.
//  Copyright © 2019年 XXX. All rights reserved.
//

import UIKit
import SVProgressHUD

extension SVProgressHUD {
    // 设置SVProgress属性
    static func configuration() {
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
        SVProgressHUD.setBackgroundColor(UIColor(r: 0, g: 0, b: 0, alpha: 0.3))
    }
}
