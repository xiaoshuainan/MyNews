//
//  HomeNavigationView.swift
//  MyNews
//
//  Created by xsn on 2018/12/28.
//  Copyright © 2018年 XXX. All rights reserved.
//

import UIKit
import IBAnimatable

class HomeNavigationView: UIView, NibLoadable {
    //MARK:Outlet控件
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var searchButton: AnimatableButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    //MARK:按钮点击实现Block
    /// 头像
    var didSelectAvatarButton: (()->())?
    /// 搜索
    var didSelectSearchButton: (()->())?
    //相机
    var didSelectCameraButton: (()->())?
    
    //MARK:按钮点击事件
    /// 点击头像按钮
    @IBAction func avatarButtonClicked(_ sender: Any) {
        didSelectAvatarButton?()
    }
    
    /// 点击搜索按钮
    @IBAction func searchButtonClicked(_ sender: Any) {
        didSelectSearchButton?()
    }
    
    /// 点击相机按钮
    @IBAction func cameraButtonClicked(_ sender: Any) {
        didSelectCameraButton?()
    }
    
    //MARK:方法的重写
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarButton.theme_setImage("images.home_no_login_head", forState: [.normal, .highlighted])
        searchButton.theme_backgroundColor = "colors.cellBackgroundColor"
        searchButton.theme_setTitleColor("colors.grayColor150", forState: .normal)
        searchButton.setImage(UIImage(named: "search_small_16x16_"), for: [.normal, .highlighted])
        cameraButton.theme_setImage("images.home_camera", forState: [.normal, .highlighted])
    }
    
    /// 固有的大小
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    /// 重写frame
    override var frame: CGRect {
        didSet {
            super.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 44)
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
