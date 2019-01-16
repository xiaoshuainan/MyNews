//
//  VideoPlayerCustomView.swift
//  MyNews
//
//  Created by xsn on 2019/1/16.
//  Copyright © 2019年 XXX. All rights reserved.
//

import BMPlayer
import SnapKit

class VideoPlayerCustomView: BMPlayerControlView {
    override func customizeUIComponents() {
        BMPlayerConf.topBarShowInCase = .none
    }
}
