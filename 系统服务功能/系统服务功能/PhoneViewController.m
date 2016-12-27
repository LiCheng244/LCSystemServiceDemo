//
//  PhoneViewController.m
//  系统服务功能
//
//  Created by LiCheng on 2016/12/27.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "PhoneViewController.h"

@interface PhoneViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - 拨打电话 1
- (IBAction)callPhone1:(id)sender {
    
    // 最简单最直接的方式: 直接跳转到拨号界面
    // 缺点: 拨打电话完毕后, 不会自动回到原应用界面, 直接停留在通话记录界面
    
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - 拨打电话 2
- (IBAction)callPhone2:(id)sender {
    
    // 拨号之前会弹框询问用户是否拨号, 拨号完毕后会直接回到原应用
    // 缺点: 因为是私有API, 所以可能会被拒掉
    NSURL *url = [NSURL URLWithString:@"telprompt://10086"];
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - 拨打电话 3
- (IBAction)callPhone3:(id)sender {
    
    /**
     *  创建一个UIWebView来加载url, 拨号后能自动回到原应用
     *
     *  拨号之前会弹框询问用户是否拨号, 拨号完毕后自动回到原应用
     *
     *  注意: webView不要设置尺寸, 不然会遮挡住其他界面  只是用来打电话,不需要显示
     */
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:(CGRectZero)];
    }
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

@end
