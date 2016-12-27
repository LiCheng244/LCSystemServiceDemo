//
//  EmailViewController.m
//  系统服务功能
//
//  Created by LiCheng on 2016/12/27.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>


@interface EmailViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - 发邮件
- (IBAction)sendEmail1:(id)sender {
    
    // 调用系统自带的邮件客户端, 发完邮件后不会自动回到原应用
    
    NSURL *url = [NSURL URLWithString:@"mailro://244344094@qq.com"];
    [[UIApplication sharedApplication] openURL:url];
    
}
- (IBAction)sendEmail2:(id)sender {
    
    // 指定邮件内容, 和发短信方式2 差不多.  使用
    MFMailComposeViewController *emailVC = [[MFMailComposeViewController alloc] init];
    emailVC.mailComposeDelegate = self;
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {
    
    
    if (result == MFMailComposeResultCancelled) {
        NSLog(@"取消发送");
    }else if (result == MFMailComposeResultSent){
        NSLog(@"已经发出");
    }else if (result == MFMailComposeResultFailed){
        NSLog(@"发送失败");
    }else if(result == MFMailComposeResultSaved){
        NSLog(@"保存草稿");
    }
}

@end
