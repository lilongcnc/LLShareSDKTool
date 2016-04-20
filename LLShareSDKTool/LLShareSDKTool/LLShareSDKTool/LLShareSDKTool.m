//
//  LLShareSDKTool.m
//  LLShareSDKTool
//
//  Created by 李龙 on 16/4/7.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "LLShareSDKTool.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <ShareSDKUI/ShareSDKUI.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"
#import "WeiboSDK.h"

@implementation LLShareSDKTool

//分享功能
static NSString *const ShareAppKey = @"99c0f8716494";

//微信开放平台,申请地址:https://open.weixin.qq.com/
static NSString *const WXShareAppID = @"wxf9b19185fadfb46c";
static NSString *const WXShareAppSecret = @"46994e1b3690840ca54a085f076d79c2";

//新浪分享:申请地址http://open.weibo.com/apps/192207424/info/basic
static NSString *const SinaShareAppKey = @"";
static NSString *const SinaShareAppSecret = @"";

//腾讯开发者开发者平台,申请地址:
static NSString *const QQShareAppID = @"wxf9b19185fadfb46c";
static NSString *const QQShareAppSecret = @"46994e1b3690840ca54a085f076d79c2";

+ (void)initialize{
    
    [LLShareSDKTool registerShare];
}

#pragma mark - ShareSDK 注册
+(void)registerShare
{
    NSLog(@"%s",__FUNCTION__);
    
    //registerApp 初始化SDK并且初始化第三方平台
    [ShareSDK registerApp:ShareAppKey
          activePlatforms:@[@(SSDKPlatformSubTypeWechatSession),
                            @(SSDKPlatformSubTypeWechatTimeline),
                            @(SSDKPlatformTypeSinaWeibo)]
                 onImport:^(SSDKPlatformType platformType) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:{
                             [ShareSDKConnector connectWeChat:[WXApi class]];
                             break;
                         }
                         case SSDKPlatformTypeSinaWeibo:
                             [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                             break;
                         case SSDKPlatformTypeQQ:
                             [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                             break;
                         default:
                             break;
                     }
                     
                 } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:
                             [appInfo SSDKSetupWeChatByAppId:WXShareAppID
                                                   appSecret:WXShareAppSecret];
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                             //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                             [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                                       appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                                     redirectUri:@"http://www.sharesdk.cn"
                                                        authType:SSDKAuthTypeBoth];
                             break;
                         case SSDKPlatformTypeQQ:
                             [appInfo SSDKSetupQQByAppId:@"100371282"
                                                  appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                                authType:SSDKAuthTypeBoth];
                             break;
                         default:
                             break;
                     }
                 }
     ];
}


#pragma mark- 分享代码
+ (void)shareContentWithShareContentType:(LLShareContentType)shareContentType contentTitle:(NSString *)contentTitle contentDescription:(NSString *)contentDescription contentImage:(id)contentImage contentURL:(NSString *)contentURL showInView:(UIView *)showInView success:(void (^)())success failure:(void (^)(NSString *))failure OtherResponseStatus:(void (^)(SSDKResponseState))otherResponseStatus
{
    //0.区分分享类型
    SSDKContentType type;
    switch (shareContentType) {
        case LLShareContentTypeAuto: // 自动适配类型，视传入的参数来决定
            type = SSDKContentTypeAuto;
            break;
        case LLShareContentTypeText: //文本
            type = SSDKContentTypeText;
            break;
            
        case LLShareContentTypeImage://图片
            type = SSDKContentTypeImage;
            break;
            
        case LLShareContentTypeWebPage://网页
            type = SSDKContentTypeWebPage;
            break;
            
        case LLShareContentTypeApp: //应用
            type = SSDKContentTypeApp;
            break;
            
        case LLShareContentTypeAudio://音频
            type = SSDKContentTypeAudio;
            break;
            
        case LLShareContentTypeVideo://视频
            type = SSDKContentTypeVideo;
            break;
        case LLShareContentTypeFile://文件类型(暂时仅微信可用)
            type = SSDKContentTypeFile;
            break;
            
        default:
            break;
    }
    
    //1. 创建分享参数
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:contentDescription
                                     images:contentImage
                                        url:[NSURL URLWithString:contentURL]
                                      title:contentTitle
                                       type:type];
    
    //2. 分享,显示分享view
    [ShareSDK showShareActionSheet:showInView
                             items:nil
                       shareParams:shareParams
               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                   
                   NSLog(@"SSDKResponseState state:%lu",(unsigned long)state);
                   switch (state) {
                           
                       case SSDKResponseStateBegin:
                       {
                           //这里不填写
                           break;
                       }
                       case SSDKResponseStateSuccess:
                       {
                           NSLog(@"0");
                           success();
                           break;
                           
                       }
                       case SSDKResponseStateFail:
                       {
                           
                           if (platformType == SSDKPlatformTypeSMS && [error code] == 201)
                           {
                               
                               NSLog(@"1");
                               
                               failure(@"失败原因可能是：1、短信应用没有设置帐号；2、设备不支持短信应用；3、短信应用在iOS 7以上才能发送带附件的短                                                     信。");
                               break;
                               
                           }
                           else if(platformType == SSDKPlatformTypeMail && [error code] == 201)
                           {
                             
                               NSLog(@"2");
                               failure(@"失败原因可能是：1、邮件应用没有设置帐号；2、设备不支持邮件应用；");
                               break;
                               
                           }
                           else
                           {
                               
                               NSLog(@"3");
                               failure([NSString stringWithFormat:@"%@",error]);
                               break;
                               
                           }
                           break;
                       }
                       case SSDKResponseStateCancel:
                       {
                           
                           NSLog(@"4");
//                           otherResponseStatus(SSDKResponseStateCancel); //捕获不准确
                           break;
                           
                       }
                       default:
                           break;
                   }
                   
                   if (state != SSDKResponseStateBegin)
                   {
                       NSLog(@"5");
//                         failure([NSString stringWithFormat:@"%@",error]);
                       
                   }
                   
               }];
}


@end
