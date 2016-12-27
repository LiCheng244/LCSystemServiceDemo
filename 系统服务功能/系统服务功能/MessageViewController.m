//
//  MessageViewController.m
//  系统服务功能
//
//  Created by LiCheng on 2016/12/27.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "MessageViewController.h"
#import <MessageUI/MessageUI.h>


@interface MessageViewController ()<MFMessageComposeViewControllerDelegate>

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}



#pragma mark - 发短信
- (IBAction)sendMessage1:(id)sender {
    
    // 直接跳转到发短信界面, 但是不能指定短信内容, 而且不能返回到原应用
    NSURL *url = [NSURL URLWithString:@"sms://15084089244"];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)sendMessage2:(id)sender {
    
    // 如果想指定短信内容, 使用MessageUI框架
    //1. 导入头文件
    
    //2. 显示发短信的控制器
    MFMessageComposeViewController *messageVC = [[MFMessageComposeViewController alloc] init];
    
    //3. 设置短信内容
    messageVC.body = @"吃饭了?";
    
    //4. 设置收件人列表(可以添加多个)
    messageVC.recipients = @[@"13917714464", @"15084089244"];
    
    //5. 设置代理
    messageVC.messageComposeDelegate = self;
    
    [self presentViewController:messageVC animated:YES completion:nil];
}


#pragma mark - 代理方法
// 当短信界面关闭的时候调用, 发完后会自动回到原应用
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    // 关闭短信界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled) {
        NSLog(@"取消发送");
    }else if (result == MessageComposeResultSent){
        NSLog(@"已经发出");
    }else{
        NSLog(@"发送失败");
    }
}



@end
