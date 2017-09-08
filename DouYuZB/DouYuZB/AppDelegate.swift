//
//  AppDelegate.swift
//  DouYuZB
//
//  Created by apple on 2017/9/6.
//  Copyright © 2017年 chencision. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //tabbar图标恢复图片颜色
        UITabBar.appearance().tintColor = UIColor.orange
        
        return true
    }

}

