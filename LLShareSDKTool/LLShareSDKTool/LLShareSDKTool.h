//
//  LLShareSDKTool.h
//  LLShareSDKTool
//
//  Created by 李龙 on 16/4/7.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>

/**
 *  分享的内容类型
 */
//typedef enum {
//    /**
//     *  自动适配类型，视传入的参数来决定
//     */
//    LLShareContentTypeAuto         = 0,
//    
//    /**
//     *  文本
//     */
//    LLShareContentTypeText         = 1,
//    
//    /**
//     *  图片
//     */
//    LLShareContentTypeImage        = 2,
//    
//    /**
//     *  网页
//     */
//    LLShareContentTypeWebPage      = 3,
//    
//    /**
//     *  应用
//     */
//    LLShareContentTypeApp          = 4,
//    
//    /**
//     *  音频
//     */
//    LLShareContentTypeAudio        = 5,
//    
//    /**
//     *  视频
//     */
//    LLShareContentTypeVideo        = 6,
//    
//    /**
//     *  文件类型(暂时仅微信可用)
//     */
//    LLShareContentTypeFile         = 7
//}LLShareContentType;

typedef NS_ENUM(NSUInteger, LLShareContentType){
    /**
     *  自动适配类型，视传入的参数来决定
     */
    LLShareContentTypeAuto         = 0,

    /**
     *  文本
     */
    LLShareContentTypeText         = 1,

    /**
     *  图片
     */
    LLShareContentTypeImage        = 2,

    /**
     *  网页
     */
    LLShareContentTypeWebPage      = 3,

    /**
     *  应用
     */
    LLShareContentTypeApp          = 4,

    /**
     *  音频
     */
    LLShareContentTypeAudio        = 5,

    /**
     *  视频
     */
    LLShareContentTypeVideo        = 6,

    /**
     *  文件类型(暂时仅微信可用)
     */
    LLShareContentTypeFile         = 7

};

@interface LLShareSDKTool : NSObject

+(void)shareContentWithShareContentType:(LLShareContentType)shareContentType
            contentTitle:(NSString *)contentTitle
          contentDescription:(NSString *)contentDescription
          contentImage:(id)contentImage
                  contentURL:(NSString *)contentURL
                  showInView:(UIView *)showInView
                     success:(void (^)())success
                     failure:(void (^)(NSString *failureInfo))failure
         OtherResponseStatus:(void (^)(SSDKResponseState state))otherResponseStatus;


@end


// 放弃这种枚举,因为不能再创建的时候快速出现枚举的提示
 //typedef NS_ENUM(NSUInteger, LLShareContentType){
 //    /**
 //     *  自动适配类型，视传入的参数来决定
 //     */
//    LLShareContentTypeAuto         = 0,
//
//    /**
//     *  文本
//     */
//    LLShareContentTypeText         = 1,
//
//    /**
//     *  图片
//     */
//    LLShareContentTypeImage        = 2,
//
//    /**
//     *  网页
//     */
//    LLShareContentTypeWebPage      = 3,
//
//    /**
//     *  应用
//     */
//    LLShareContentTypeApp          = 4,
//
//    /**
//     *  音频
//     */
//    LLShareContentTypeAudio        = 5,
//
//    /**
//     *  视频
//     */
//    LLShareContentTypeVideo        = 6,
//
//    /**
//     *  文件类型(暂时仅微信可用)
//     */
//    LLShareContentTypeFile         = 7
//
//};

