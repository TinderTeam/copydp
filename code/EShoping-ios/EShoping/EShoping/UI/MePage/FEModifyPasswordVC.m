//
//  FEModifyPasswordVC.m
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEModifyPasswordVC.h"
#import "CDUser.h"
#import "GAAlertObj.h"
#import "FEUserModifyPswRequest.h"
#import "FEUserModifyPswResponse.h"
#import "FEShopWebServiceManager.h"
#import "FEShopingMeTableVC.h"

@interface FEModifyPasswordVC ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *originPassword;
@property (strong, nonatomic) IBOutlet UITextField *passwordNew;
@property (strong, nonatomic) IBOutlet UITextField *confirmPassword;


@end

@implementation FEModifyPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.originPassword becomeFirstResponder];
    self.title = FEString(@"修改密码");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFeildDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (self.originPassword == textField) {
        [self.passwordNew becomeFirstResponder];
    }else if(self.passwordNew == textField){
        [self.confirmPassword becomeFirstResponder];
    }else{
        [self submitPassword];
    }
    return YES;
}

-(void)submitPassword{
   
    if ([self.originPassword.text isEqualToString:FELoginUser.password]) {
        if (self.passwordNew.text.length < 6) {
            kAlert(@"请输入6位以上新密码");
            return;
        }
        if (self.passwordNew.text.length && self.confirmPassword.text.length && [self.passwordNew.text isEqualToString:self.confirmPassword.text]) {
            __weak typeof(self) weakself = self;
            [self displayHUD:FEString(@"加载中...")];
            FEUserModifyPswRequest *rdata = [[FEUserModifyPswRequest alloc] initWithUname:FELoginUser.username oldPassword:FELoginUser.password newPassword:self.passwordNew.text];
            [[FEShopWebServiceManager sharedInstance] modifyPassword:rdata response:^(NSError *error, FEUserModifyPswResponse *response) {
                if (!error && response.result.errorCode.integerValue == 0) {
                    FEShopingMeTableVC *vc = [weakself.navigationController.viewControllers firstObject];
                    [weakself.navigationController popToRootViewControllerAnimated:NO];
                    FEDeletUser();
                    [[NSNotificationCenter defaultCenter] postNotificationName:FEUserStatDidChang object:nil];
                    [vc toSignin];
                }
                [weakself hideHUD:YES];
            }];
        }else{
            [[GAAlertObj alertWithTitle:FEString(@"提示") message:FEString(@"新密码不一致,请重新输入")] show];
        }
    }else{
        [[GAAlertObj alertWithTitle:FEString(@"提示") message:FEString(@"输入的原始密码不正确")] show];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
