//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017 chencision. All rights reserved.
//

import UIKit

private let kTittleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    
    //懒加载属性
    public lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTittleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.backgroundColor = UIColor.white
        return titleView
    }()
    
    public lazy var pageContentView : PageContentView = {
        //1 确定内容frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTittleViewH
        let contentFrame = CGRect(x:0,y:kStatusBarH+kNavigationBarH+kTittleViewH,width:kScreenW,height:contentH)
        
        //2 确定所有内容自控制器()
        var childVcs = [UIViewController]()
        for _ in 0..<4{
            let vc = UIViewController()
            //颜色设置随机数 重写构造函数
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        return contentView
    }()
    
    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置UI界面
        setupUI()
    }
}

extension HomeViewController{
    public func setupUI(){
        //不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //1.设置导航栏
        setupNavigationBar()
        
        //2.添加TittleView
        view.addSubview(pageTitleView)
        
        //3.添加ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
    }
    
    private func setupNavigationBar(){
        //1. 设置左侧的Item
//        let btn = UIButton()
//        btn.setImage(UIImage(named:"logo"), for: .normal)
//        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
    
        //2. 设置右侧的Item
        let size = CGSize(width: 40, height: 40)

        let historyItem = UIBarButtonItem(imageName: "viewHistoryIcon", highImageName: "viewHistoryIconHL", size: size)
        let searchItem = UIBarButtonItem(imageName: "find", highImageName: "findHL", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "QRcode", highImageName: "QRcodeHL", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    }
    
}
