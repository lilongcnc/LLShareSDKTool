//
//  nnnnnnn.m
//  LLShareSDKTool
//
//  Created by 李龙 on 16/4/7.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "nnnnnnn.h"

@implementation nnnnnnn

/**
 
 //创建分享参数
 NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
 
 //    [shareParams SSDKSetupShareParamsByText:@"cehimiingzi" images:@[[UIImage imageNamed:@"test"]] url: [NSURL URLWithString:@"http://www.baidu.com"] title:@"标题名字" type:SSDKContentTypeText | SSDKContentTypeImage ];
 
 
 //分享图片
 NSArray* imageArray = @[[UIImage imageNamed:@"test"]];
 [shareParams SSDKSetupShareParamsByText:@"分享内容"
 images:imageArray
 url:[NSURL URLWithString:@"http://lilongcnc.cc"]
 title:@"分享标题" //连接的标题?
 type:SSDKContentTypeWebPage];//SSDKContentTypeImage
 
 //分享网络连接
 //        NSString *wxTitle;
 //        NSString *wxText;
 //        UIImage *shareImg;
 //        wxTitle = @"快来下载吧!畅享当地第一手的吃喝玩乐信息!";
 //        wxText = @"点击这里的链接君,可以直接下载app哦!";
 //        shareImg = [UIImage imageNamed:@"icon"];
 //        [shareParams SSDKSetupWeChatParamsByText:wxText
 //                                           title:wxTitle
 //                                             url:[NSURL URLWithString:@"http://www.lilongcnc.cc"]
 //                                      thumbImage:shareImg
 //                                           image:nil
 //                                    musicFileURL:nil
 //                                         extInfo:nil
 //                                        fileData:nil
 //                                    emoticonData:nil
 //                                            type:SSDKContentTypeWebPage
 //                              forPlatformSubType:SSDKPlatformSubTypeWechatSession];
 
 
 
 //2、分享,显示分享view
 [ShareSDK showShareActionSheet:self.view
 items:nil
 shareParams:shareParams
 onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
 
 switch (state) {
 
 case SSDKResponseStateBegin:
 {
 
 break;
 }
 case SSDKResponseStateSuccess:
 {
 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
 message:nil
 delegate:nil
 cancelButtonTitle:@"确定"
 otherButtonTitles:nil];
 [alertView show];
 break;
 }
 case SSDKResponseStateFail:
 {
 if (platformType == SSDKPlatformTypeSMS && [error code] == 201)
 {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
 message:@"失败原因可能是：1、短信应用没有设置帐号；2、设备不支持短信应用；3、短信应用在iOS 7以上才能发送带附件的短信。"
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil, nil];
 [alert show];
 break;
 }
 else if(platformType == SSDKPlatformTypeMail && [error code] == 201)
 {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
 message:@"失败原因可能是：1、邮件应用没有设置帐号；2、设备不支持邮件应用；"
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil, nil];
 [alert show];
 break;
 }
 else
 {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
 message:[NSString stringWithFormat:@"%@",error]
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil, nil];
 [alert show];
 break;
 }
 break;
 }
 //                           case SSDKResponseStateCancel:
 //                           {
 //                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享已取消"
 //                                                                                   message:nil
 //                                                                                  delegate:nil
 //                                                                         cancelButtonTitle:@"确定"
 //                                                                         otherButtonTitles:nil];
 //                               [alertView show];
 //                               break;
 //                           }
 default:
 break;
 }
 
 if (state != SSDKResponseStateBegin)
 {
 //                       [theController showLoadingView:NO];
 //                       [theController.tableView reloadData];
 }
 
 }];
 
 
 */



@end
