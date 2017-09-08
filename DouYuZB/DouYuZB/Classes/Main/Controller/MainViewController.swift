//
//  MainViewController.swift
//  DouYuZB
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017 chencision. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVc(StoryName: "Home")
        addChildVc(StoryName: "Live")
        addChildVc(StoryName: "Follow")
        addChildVc(StoryName: "Mine")
    }
    
    private func addChildVc(StoryName:String){
        //1.通过storyboard获取控制器
        let childVc = UIStoryboard(name: StoryName,bundle: nil).instantiateInitialViewController()!
        
        //2.将ChildVc作为自控制器
        addChildViewController(childVc)

    }
}
