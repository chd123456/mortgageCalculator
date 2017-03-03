//
//  AppDelegate.swift
//  SSCYYlink
//
//  Created by 崔海达 on 16/10/24.
//  Copyright © 2016年 yonyou. All rights reserved.
//

import UIKit
let DeviceW = UIScreen.main.bounds.size.width
let DeviceH = UIScreen.main.bounds.size.height

var isSaveOrUpdate = false
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UIApplication.shared.statusBarStyle = .lightContent
        if window == nil{
            self.window = UIWindow()
        }
        window?.frame = UIScreen.main.bounds
        self.window?.backgroundColor = UIColor.white
        
        let mainVC = CHDNavigationController(rootViewController: CHDViewController())
        window?.rootViewController = mainVC
        
        window?.makeKeyAndVisible()
        
        Bugly.start(withAppId: "dd857680b5")

        return true
    }
    
    
}

