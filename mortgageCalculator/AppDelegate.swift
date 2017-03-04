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

        
        
        /**
         *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
         *  在将生成的AppKey传入到此方法中。
         *  方法中的第二个参数用于指定要使用哪些社交平台，以数组形式传入。第三个参数为需要连接社交平台SDK时触发，
         *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
         *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
         */
  
        ShareSDK.registerApp("1bcd7bdb2ca98", activePlatforms:[
                        SSDKPlatformType.subTypeWechatTimeline.rawValue,
                        SSDKPlatformType.subTypeWechatSession.rawValue],
                                         onImport: { (platform : SSDKPlatformType) in
                                switch platform
                                {

                                case SSDKPlatformType.subTypeWechatSession:
                                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                                case SSDKPlatformType.subTypeWechatTimeline:
                                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                                default:
                                    break
                                }
                                
        }) { (platform : SSDKPlatformType, appInfo : NSMutableDictionary?) in
            
            switch platform
            {
            
            case SSDKPlatformType.subTypeWechatTimeline:
                //设置微信应用信息
                appInfo?.ssdkSetupWeChat(byAppId: "wxff4e5bc239e0e495", appSecret: "8ee70f5dc0efe44fb2cb162225a23496")
            case SSDKPlatformType.subTypeWechatSession:
                //设置微信应用信息
                appInfo?.ssdkSetupWeChat(byAppId: "wxff4e5bc239e0e495", appSecret: "8ee70f5dc0efe44fb2cb162225a23496")
            default:
                break
            }
            
        }
        
        
        
        return true
    }
    
    
}

