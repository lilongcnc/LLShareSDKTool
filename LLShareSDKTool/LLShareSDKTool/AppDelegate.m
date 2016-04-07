//
//  AppDelegate.m
//  LLShareSDKTool
//
//  Created by 李龙 on 16/4/7.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WXApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self registerShare];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



//分享功能
static NSString *const ShareAppKey = @"99c0f8716494";

//微信分享
static NSString *const WXShareAppID = @"wx63383dfb47aa5873";
static NSString *const WXShareAppSecret = @"e3e9f51d5d35878505787a2b56af4efe";



#pragma mark - ShareSDK 注册
-(void)registerShare
{
    NSLog(@"%s",__FUNCTION__);
    
    //registerApp 初始化SDK并且初始化第三方平台
    [ShareSDK registerApp:ShareAppKey
          activePlatforms:@[@(SSDKPlatformSubTypeWechatSession),
                            @(SSDKPlatformSubTypeWechatTimeline)]
                 onImport:^(SSDKPlatformType platformType) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:{
                             [ShareSDKConnector connectWeChat:[WXApi class]];
                             break;
                         }
                         default:
                             break;
                     }
                     
                 } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:
                             [appInfo SSDKSetupWeChatByAppId:WXShareAppID appSecret:WXShareAppSecret];
                             break;
                         default:
                             break;
                     }
                 }
     ];
}
@end
