//
//  FEModifyInfoVC.m
//  EShoping
//
//  Created by Seven on 15-3-13.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEModifyInfoVC.h"
#import "NSString+Verify.h"

@interface FEModifyInfoVC ()
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *email;


@end

@implementation FEModifyInfoVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = FEString(@"用户信息修改");
}

- (IBAction)saveInfo:(id)sender {
    if (self.phoneNumber.text.length) {
        if ([self.phoneNumber.text isPhone]) {
            if (self.email.text.length) {
                if ([self.email.text isEmailType]) {
                    NSLog(@"email");
                }else{
                    kAlert(@"邮箱格式不正确！");
                }
            }else{
                NSLog(@"no email");
            }
        }else{
            kAlert(@"手机格式不正确！")
        }
    }else{
        kAlert(@"请输入手机号！")
    }
}

@end
