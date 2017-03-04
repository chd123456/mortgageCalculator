'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'mortgageCalculator' do

pod 'Bugly'
# 主模块(必须)
pod 'ShareSDK3'
# Mob 公共库(必须) 如果同时集成SMSSDK iOS2.0:可看此注意事项：http://bbs.mob.com/thread-20051-1-1.html
pod 'MOBFoundation'

# UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
pod 'ShareSDK3/ShareSDKUI'

# 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
pod 'ShareSDK3/ShareSDKPlatforms/QQ'
pod 'ShareSDK3/ShareSDKPlatforms/SinaWeibo'
pod 'ShareSDK3/ShareSDKPlatforms/WeChat'

# ShareSDKPlatforms模块其他平台，按需添加
# 如果需要的平台没有对应的平台语句，有2种情况——1、不需要添加这个平台的语句，如Twitter就是这个情况。2、ShareSDK暂时不支持此平台。
pod 'ShareSDK3/ShareSDKPlatforms/RenRen'
pod 'ShareSDK3/ShareSDKPlatforms/AliPaySocial'
pod 'ShareSDK3/ShareSDKPlatforms/Kakao'
pod 'ShareSDK3/ShareSDKPlatforms/Yixin'
pod 'ShareSDK3/ShareSDKPlatforms/Facebook'
pod 'ShareSDK3/ShareSDKPlatforms/Copy'
pod 'ShareSDK3/ShareSDKPlatforms/Evernote'
pod 'ShareSDK3/ShareSDKPlatforms/GooglePlus'
pod 'ShareSDK3/ShareSDKPlatforms/Instagram'
pod 'ShareSDK3/ShareSDKPlatforms/Instapaper'
pod 'ShareSDK3/ShareSDKPlatforms/Line'
pod 'ShareSDK3/ShareSDKPlatforms/Mail'
pod 'ShareSDK3/ShareSDKPlatforms/SMS'
pod 'ShareSDK3/ShareSDKPlatforms/WhatsApp'
pod 'ShareSDK3/ShareSDKPlatforms/WeChat'

# 使用配置文件分享模块（非必需）
pod 'ShareSDK3/ShareSDKConfigurationFile'

# 扩展模块（在调用可以弹出我们UI分享方法的时候是必需的）
pod 'ShareSDK3/ShareSDKExtension'
end
