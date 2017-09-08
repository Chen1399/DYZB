//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017 chencision. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI界面
        setupUI()
    }
}

extension HomeViewController{
    public func setupUI(){
        //1.设置导航栏
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        //1. 设置左侧的Item
        let btn = UIButton()
        btn.setImage(UIImage(named:"logo"), for: .normal)
        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    
        //2. 设置右侧的Item
        let size = CGSize(width: 40, height: 40)

        let historyItem = UIBarButtonItem(imageName: "viewHistoryIcon", highImageName: "viewHistoryIconHL", size: size)
        let searchItem = UIBarButtonItem(imageName: "find", highImageName: "findHL", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "QRcode", highImageName: "QRcodeHL", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    }
    
}
