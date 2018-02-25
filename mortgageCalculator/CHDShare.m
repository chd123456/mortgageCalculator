//
//  CHDShare.m
//  社会化分享Demo
//
//  Created by 崔海达 on 2017/9/4.
//  Copyright © 2017年 崔海达. All rights reserved.
//

#import "CHDShare.h"
#import <UIKit/UIKit.h>
@implementation CHDShare
+(void)sharedForDescript:(NSString *)descript imageName: (NSString *)imageName setUrl: (NSString *)urlString isUseAirDrop:(BOOL)isUsed currentViewController:(UIViewController *)currentViewController comletedHandle:(void (^)(void))comletedHandle cancelHandle:(void (^)(void))cancelHandle{
    
    NSString* encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSArray *activityItems = @[descript, [UIImage imageNamed:imageName], [NSURL URLWithString:encodedString]];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    if (!isUsed) {
        activityVC.excludedActivityTypes = @[UIActivityTypeAirDrop];
    }
    activityVC.completionWithItemsHandler = ^(UIActivityType activityType,BOOL completed,NSArray * _Nullable returnedItems,NSError * _Nullable activityError) {
        
        if (completed)  {
            if (comletedHandle) {
                comletedHandle();
            }
        }else {
            if (cancelHandle) {
                cancelHandle();
            }
        }
        
    };
    [currentViewController presentViewController:activityVC animated:YES completion:nil];
}

+(void)sharedForDescript:(NSString *)descript atSandPathOfName: (NSString *)atSandPathOfName isUseAirDrop:(BOOL)isUsed currentViewController:(UIViewController *)currentViewController comletedHandle:(void (^)(void))comletedHandle cancelHandle:(void (^)(void))cancelHandle{
    NSArray *activityItems = @[descript, [[NSBundle mainBundle] URLForResource:atSandPathOfName withExtension:@"pdf"]];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    if (!isUsed) {
        activityVC.excludedActivityTypes = @[UIActivityTypeAirDrop];
    }
    activityVC.completionWithItemsHandler = ^(UIActivityType activityType,BOOL completed,NSArray * _Nullable returnedItems,NSError * _Nullable activityError) {
        
        if (completed)  {
            if (comletedHandle) {
                comletedHandle();
            }
        }else {
            if (cancelHandle) {
                cancelHandle();
            }
        }
        
    };
    [currentViewController presentViewController:activityVC animated:YES completion:nil];
}
@end
