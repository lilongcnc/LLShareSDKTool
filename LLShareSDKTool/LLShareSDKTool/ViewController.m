//
//  ViewController.m
//  LLShareSDKTool
//
//  Created by 李龙 on 16/4/7.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "LLShareSDKTool.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)shareBtnOnClick:(UIButton *)sender {
    [self shareBtnOnClick];
}



#pragma 分享
-(void)shareBtnOnClick{

    //Tips: LLShareContentTypeAuto类型情况下,如果分享图片的话,contentURL直接设置为nil;如果分享链接,则不设置为nil
    [LLShareSDKTool shareContentWithShareContentType:LLShareContentTypeAuto contentTitle:@"测试分享" contentDescription:@"李龙的技术分享博客 http://www.lilongcnc.cc" contentImage:[UIImage imageNamed:@"test4"] contentURL:@"http://lilongcnc.cc" showInView:self.view success:^{
        
        NSLog(@"分享成功");
    } failure:^(NSString *failureInfo) {
        
        NSLog(@"分享失败:%@",failureInfo);
        
    } OtherResponseStatus:^(SSDKResponseState state) {
        NSLog(@"分享异常类型");
    }];
    
    /**
     test1.png 1.2M 868*896 在QQ 中提示太大
     test2.png 328K 438*419 微信/微信分享只进入'SSDKResponseStateBegin'
     test3.png 117K 868*896 QQ/QQ空间 分享会提示图片太大
     test4.png 112K 200*206 微信/微信分享只进入'SSDKResponseStateBegin'
     这里涉及到平台分享规则:http://wiki.mob.com/%E5%B9%B3%E5%8F%B0%E7%89%B9%E6%AE%8A%E6%80%A7/
     */
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
