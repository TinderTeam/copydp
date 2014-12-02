//
//  FESiginVC.m
//  EShoping
//
//  Created by Seven on 14-11-19.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FESiginVC.h"
#import "FEShopWebServiceManager.h"
#import "FEUserSigninRequest.h"
#import "FEUserSigninResponse.h"
#import "FEResult.h"
#import "FEUser.h"
#import "AppDelegate.h"
#import "FECoreDataHandler.h"
#import "CDUser.h"


@interface FESiginVC ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UIButton *signinButton;

@end

@implementation FESiginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = FEThemeWhite;
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
    
    self.title = @"登陆";
    self.signinButton.layer.cornerRadius = 4;
    self.signinButton.layer.masksToBounds = YES;
    [self.signinButton setBackgroundImage:[UIImage imageFromColor:FEColor(255, 100, 63, 1)] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signin:(id)sender {
    [self dismisskeyboard];
    if (![self.userName.text isEqualToString:@""] && ![self.passWord.text isEqualToString:@""]) {
        __weak typeof(self) weakself = self;
        [self displayHUD:FEString(@"登陆中...")];
        FEUserSigninRequest *rdata = [[FEUserSigninRequest alloc] initWithUname:self.userName.text password:self.passWord.text clienttype:@"1" clientversion:@"1.0" devtoken:[NSString UUID]];
        [[FEShopWebServiceManager sharedInstance] signin:rdata response:^(NSError *error, FEUserSigninResponse *response) {
            [weakself hideHUD:YES];
            if (!error && response.result.errorCode.integerValue == 0) {
                [weakself dismissViewControllerAnimated:YES completion:^{
                    FEUser *wuser = response.user;
                    CDUser *user = [FECoreData touchUserByIdentifier:wuser.user_id];
                    user.password = wuser.password;
                    user.username = wuser.username;
                    user.role = wuser.role;
                    [FECoreData saveCoreData];
                }];
            }
            
        }];
    }
    
}

- (IBAction)backPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)dismisskeyboard{
    [self.userName resignFirstResponder];
    [self.passWord resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.userName) {
        [textField resignFirstResponder];
        [self.passWord becomeFirstResponder];
    }else if(textField == self.passWord){
        [textField resignFirstResponder];
        [self signin:nil];
    }
    return YES;
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
