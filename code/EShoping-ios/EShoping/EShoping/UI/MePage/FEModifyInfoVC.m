//
//  FEModifyInfoVC.m
//  EShoping
//
//  Created by Seven on 15-3-13.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEModifyInfoVC.h"
#import "NSString+Verify.h"
#import "FEShopWebServiceManager.h"
#import "FEUserModifyRequest.h"
#import "CDCustomerUser.h"
#import "AppDelegate.h"
#import "FECoreDataHandler.h"

@interface FEModifyInfoVC ()
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *email;


@end

@implementation FEModifyInfoVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = FEString(@"用户信息修改");
    self.phoneNumber.text = self.customer.cellphone;
    self.email.text = self.customer.email;
}

- (IBAction)saveInfo:(id)sender {
    [self.phoneNumber resignFirstResponder];
    [self.email resignFirstResponder];
    if (self.phoneNumber.text.length) {
        if ([self.phoneNumber.text isPhone]) {
            if (self.email.text.length) {
                if ([self.email.text isEmailType]) {
                    NSLog(@"email");
                    self.customer.cellphone = self.phoneNumber.text;
                    self.customer.email = self.email.text;
                    [self updateProfile:self.customer];
                }else{
                    kAlert(@"邮箱格式不正确！");
                }
            }else{
                NSLog(@"no email");
            
                self.customer.cellphone = self.phoneNumber.text;
                [self updateProfile:self.customer];
            }
        }else{
            kAlert(@"手机格式不正确！")
        }
    }else{
        kAlert(@"请输入手机号！")
    }
}

-(void)updateProfile:(FECustomer *)customer{
    [self displayHUD:@"更新中..."];
    __weak typeof(self) weakself = self;
    FEUserModifyRequest *rdata = [[FEUserModifyRequest alloc] initWithCustomer:customer];
    [[FEShopWebServiceManager sharedInstance] userModify:rdata response:^(NSError *error, FEBaseResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            [weakself.navigationController popViewControllerAnimated:YES];
            FECustomer *customer = weakself.customer;
            CDCustomerUser *cdcustomer = [FECoreData touchCustomerByIdentifier:customer.user_id];
            cdcustomer.grade = customer.grade;
            cdcustomer.score = customer.score;
            cdcustomer.cellphone = customer.cellphone;
            cdcustomer.email = customer.email;
            cdcustomer.car_id = customer.car_id;
            cdcustomer.recommender_id = customer.recommender_id;
            cdcustomer.status = customer.status;
            cdcustomer.request = customer.request;
            cdcustomer.login_date = customer.login_date;
            cdcustomer.user = FELoginUser;
            [FECoreData saveCoreData];
        }
        [weakself hideHUD:YES];
    }];
}

@end
