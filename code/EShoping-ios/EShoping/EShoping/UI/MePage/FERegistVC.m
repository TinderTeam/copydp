//
//  FERegistVC.m
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FERegistVC.h"
#import "FEShopWebServiceManager.h"
#import "FEUser.h"
#import "FEUserRegistRequest.h"
#import "FEUserRegistResponse.h"
#import "FEResult.h"



@interface FERegistVC ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userIdentifierTextField;
@property (strong, nonatomic) IBOutlet UITextField *userPasswordTextField;
@property (strong, nonatomic) IBOutlet UIButton *registButton;
@property (strong, nonatomic) IBOutlet UIButton *checkButton;

@end

@implementation FERegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.registButton setBackgroundImage:[UIImage imageFromColor:FEColor(255, 100, 63, 1)] forState:UIControlStateNormal];
    self.registButton.layer.cornerRadius = 4;
    self.registButton.layer.masksToBounds = YES;
}
- (IBAction)regist:(id)sender {
    if (![self.userIdentifierTextField.text isEqualToString:@""] && ![self.userPasswordTextField.text isEqualToString:@""]) {
        __weak typeof(self) weakself = self;
        [self displayHUD:FEString(@"加载中...")];
        FEUser *user = [[FEUser alloc] initWithUserName:self.userIdentifierTextField.text password:self.userPasswordTextField.text];
        FEUserRegistRequest *rdata = [[FEUserRegistRequest alloc] initWithUser:user customer:nil code:@""];
        [[FEShopWebServiceManager sharedInstance] regist:rdata response:^(NSError *error, FEUserRegistResponse *response) {
            [weakself hideHUD:YES];
            if (!error && response.result.errorCode.integerValue == 0) {
                [weakself.navigationController popViewControllerAnimated:YES];
            }
        }];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)userRight:(id)sender {
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.userIdentifierTextField) {
        [textField resignFirstResponder];
        [self.userPasswordTextField becomeFirstResponder];
    }else if(textField == self.userPasswordTextField){
        [textField resignFirstResponder];
        [self regist:nil];
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
