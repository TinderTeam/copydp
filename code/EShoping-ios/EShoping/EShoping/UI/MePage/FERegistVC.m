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
#import "FECustomer.h"



@interface FERegistVC ()<UITextFieldDelegate>{
    CGRect scrollFrame;
}
@property (strong, nonatomic) IBOutlet UITextField *userIdentifierTextField;
@property (strong, nonatomic) IBOutlet UITextField *userPasswordTextField;
@property (strong, nonatomic) IBOutlet UIButton *registButton;
@property (strong, nonatomic) IBOutlet UIButton *checkButton;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *activeCode;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *carID;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;

@end

@implementation FERegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.frame = self.view.bounds;
    scrollFrame = self.view.frame;
    self.scrollView.contentSize = self.view.bounds.size;
    [self.registButton setBackgroundImage:[UIImage imageFromColor:FEThemeOrange] forState:UIControlStateNormal];
    self.registButton.layer.cornerRadius = 4;
    self.registButton.layer.masksToBounds = YES;
}
- (IBAction)regist:(id)sender {
    [self.userIdentifierTextField resignFirstResponder];
    [self.userPasswordTextField resignFirstResponder];
    [self.activeCode resignFirstResponder];
    [self.email resignFirstResponder];
    [self.carID resignFirstResponder];
    [self.phoneNumber resignFirstResponder];
    if (self.userIdentifierTextField.text.length && self.userPasswordTextField.text.length && self.email.text.length) {
        if (self.userPasswordTextField.text.length < 6) {
            kAlert(@"请输入6位以上密码");
            return;
        }
        if (![self.email.text isEmailType]) {
            kAlert(@"请输入正确的邮箱格式");
            return;
        }
        __weak typeof(self) weakself = self;
        [self displayHUD:FEString(@"加载中...")];
        FEUser *user = [[FEUser alloc] initWithUserName:self.userIdentifierTextField.text password:self.userPasswordTextField.text];
        
        FECustomer *custom = [[FECustomer alloc] initWithDictionary:@{@"cellphone":self.phoneNumber.text,@"email":self.email.text,@"car_id":self.carID.text}];
        FEUserRegistRequest *rdata = [[FEUserRegistRequest alloc] initWithUser:user customer:custom code:@""];
        [[FEShopWebServiceManager sharedInstance] regist:rdata response:^(NSError *error, FEUserRegistResponse *response) {
            [weakself hideHUD:YES];
            if (!error && response.result.errorCode.integerValue == 0) {
                [weakself.navigationController popViewControllerAnimated:YES];
            }
        }];
    }else{
        if (!self.userIdentifierTextField.text.length) {
            kAlert(@"请输入用户名");
        }else if (!self.userPasswordTextField.text.length){
            kAlert(@"请输入密码");
        }else{
            kAlert(@"请输入邮箱");
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)userRight:(id)sender {
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
    if (textField == self.userIdentifierTextField) {
        [self.userPasswordTextField becomeFirstResponder];
    }else if(textField == self.userPasswordTextField){
        [self.activeCode becomeFirstResponder];
    }else if(textField == self.activeCode){
        [self.email becomeFirstResponder];
    }else if(textField == self.email){
        [self.carID becomeFirstResponder];
    }else if(textField == self.carID){
        [self.phoneNumber becomeFirstResponder];
    }else if(textField == self.phoneNumber){
        [self regist:nil];
    }
    return YES;
}

- (void)keyboardWillShow:(CGRect)newRect duration:(NSTimeInterval)duration{
    self.view.frame = CGRectMake(scrollFrame.origin.x, scrollFrame.origin.y, scrollFrame.size.width, scrollFrame.size.height - newRect.size.height);
}
- (void)keyboardWillHide:(CGRect)newRect duration:(NSTimeInterval)duration{
    self.view.frame = scrollFrame;
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
