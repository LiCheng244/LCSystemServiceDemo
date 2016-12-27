//
//  WebViewController.m
//  系统服务功能
//
//  Created by LiCheng on 2016/12/27.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 跳转到网站
- (IBAction)skipForWeb:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [[UIApplication sharedApplication] openURL:url];
    
}


@end
