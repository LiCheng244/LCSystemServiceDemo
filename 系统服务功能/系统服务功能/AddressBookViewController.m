//
//  AddressBookViewController.m
//  系统服务功能
//
//  Created by LiCheng on 2016/12/27.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "AddressBookViewController.h"

#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface AddressBookViewController () <CNContactPickerDelegate>

@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)openAddressBook:(id)sender {
    
    
    CNContactPickerViewController * con = [[CNContactPickerViewController alloc]init];
    con.delegate = self;
    [self presentViewController:con animated:YES completion:nil];
}

-(IBAction)addAddressBook:(id)sender{
    
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
    
    /**
     *  <CNContact: 0x1468a3d0:
     identifier=28F7235F-1B58-46AC-86C4-1937F20139A2,
     givenName=,
     familyName=姐,
     organizationName=,
     phoneNumbers=(
     "<CNLabeledValue: 0x14680c90:
     identifier=326150B5-BCC5-4381-AD5B-9A581289617B,
     label=_$!<Mobile>!$_,
     value=<CNPhoneNumber: 0x14685d90:
     countryCode=cn,
     digits=15694226026>>"
     ),
     emailAddresses=(),
     postalAddresses=()
     >
     */
    
    CNLabeledValue<CNPhoneNumber *> *number = contact.phoneNumbers[0];
    NSLog(@"%@", number.value);
    NSLog(@"%@", contact);
    NSLog(@"%@", contact.familyName); // 用户名
    NSLog(@"%@", contact.phoneNumbers[0].value);
}
@end
