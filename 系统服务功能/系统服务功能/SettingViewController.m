//
//  SettingViewController.m
//  系统服务功能
//
//  Created by LiCheng on 2016/12/28.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(IBAction)settingClick:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

}


-(IBAction)settingLoaction:(id)sender{
        
    [self settingWithName:@"LOCATION_SERVICES"];
}

-(IBAction)settingPhotos:(id)sender{
    [self settingWithName:@"Photos"];
}
-(IBAction)settingNetwork:(id)sender{
    [self settingWithName:@"General&path=Network"];

}
-(IBAction)settingWallpaper:(id)sender{
    [self settingWithName:@"Wallpaper"];

}
-(IBAction)settingWiFi:(id)sender{
    [self settingWithName:@"WIFI"];

}
-(IBAction)settingBluetooth:(id)sender{
    [self settingWithName:@"General&path=Bluetooth"];

}
-(IBAction)settingNotice:(id)sender{
    [self settingWithName:@"NOTIFICATIONS_ID"];

}
-(IBAction)settingVolume:(id)sender{
    [self settingWithName:@"MUSIC&path=VolumeLimit"];

}

-(void)settingWithName:(NSString *)name{
    
    NSString *newName = [NSString stringWithFormat:@"Prefs:root=%@", name];
    NSLog(@"%@", newName);
    NSURL *url = [NSURL URLWithString:newName];
    [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly : @YES} completionHandler:nil];
}


@end
