//
//  PageContentView.swift
//  DouYuZB
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 chencision. All rights reserved.
//

import UIKit

class PageContentView: UIView {

    //定义属性
    public var childVcs : [UIViewController]
    public var parentViewController : UIViewController
    
    //自定义构造函数
    init(frame:CGRect,childVcs : [UIViewController],parentViewController : UIViewController){
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//设置 UI界面
extension PageContentView{
    private func setupUI(){
        //1 将所有的自控制器添加到父控制器中
        for childVc in childVcs {
            parentViewController.addChildViewController(childVc)
        }
        
        //2 添加UICollectionView,用于在Cell中存放控制器的View
    }
}
