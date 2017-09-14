//
//  PageTitleView.swift
//  DouYuZB
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 chencision. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2

class PageTitleView: UIView {

    //定义属性
    public var titles:[String]
    
    //懒加载属性
    public lazy var titleLabels : [UILabel] = [UILabel]()
    public lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    public lazy var scrollLine : UIView = {
       let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
        
    }()
    
    
    //自定义构造函数
    init(frame:CGRect , titles:[String]) {
        self.titles = titles
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//设置UI界面
extension PageTitleView{
    public func setupUI(){
        //1 添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2 添加title对应的Label
        setupTitleLabels()
        
        //3 设置底线和滚动的滑块
        setupBottomMenuAndScrollLine()
    }
    
    private func setupBottomMenuAndScrollLine(){
        //1 添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x:0,y:frame.height-lineH,width:frame.width,height: lineH)
        addSubview(bottomLine)
        
        //添加scrollLine
        //2.1 获取第一个Label
        guard let firstLabel = titleLabels.first else {return }
        firstLabel.textColor = UIColor.orange
        
        //2.2 设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height-kScrollLineH, width:firstLabel.frame.width, height: kScrollLineH)
        
    }
    
    private func setupTitleLabels(){
        
        //确定label的一些值
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index , title) in titles.enumerated(){
            //1 创建UILabel
            let label = UILabel()
            
            //2 设置Label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.black
            label.textAlignment = .center
            
            //3 设置Label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4 label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
}
