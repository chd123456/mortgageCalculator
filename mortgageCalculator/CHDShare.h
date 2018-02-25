//
//  CHDShare.h
//  社会化分享Demo
//
//  Created by 崔海达 on 2017/9/4.
//  Copyright © 2017年 崔海达. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CHDShare : NSObject

/**
 *分享一个图文解说，点击跳转到指定的url
 */
+(void)sharedForDescript:(NSString *)descript imageName: (NSString *)imageName setUrl: (NSString *)urlString isUseAirDrop:(BOOL)isUsed currentViewController:(UIViewController *)currentViewController comletedHandle:(void (^)(void))comletedHandle cancelHandle:(void (^)(void))cancelHandle;

/**
 *分享一个pdf文件
 */
+(void)sharedForDescript:(NSString *)descript atSandPathOfName: (NSString *)atSandPathOfName isUseAirDrop:(BOOL)isUsed currentViewController:(UIViewController *)currentViewController comletedHandle:(void (^)(void))comletedHandle cancelHandle:(void (^)(void))cancelHandle;

@end
