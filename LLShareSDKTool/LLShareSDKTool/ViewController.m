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


- (IBAction)shareBtnOnClick:(id)sender {
    [self shareBtnOnClick];
}



#pragma 分享
-(void)shareBtnOnClick{

    //Tips: LLShareContentTypeAuto类型情况下,如果分享图片的话,contentURL直接设置为nil;如果分享链接,则不设置为nil
    [LLShareSDKTool shareContentWithShareContentType:LLShareContentTypeAuto contentTitle:@"测试分享" contentDescription:@"李龙的技术分享博客" contentImage:[UIImage imageNamed:@"test"] contentURL:@"http://lilongcnc.cc" showInView:self.view success:^{
        
        NSLog(@"分享成功");
    } failure:^(NSString *failureInfo) {
        
        NSLog(@"分享失败:%@",failureInfo);
        
    } OtherResponseStatus:^(SSDKResponseState state) {
        NSLog(@"分享异常类型");
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
