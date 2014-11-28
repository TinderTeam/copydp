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

@interface FESiginVC ()

@end

@implementation FESiginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登陆";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signin:(id)sender {
    FEUserSigninRequest *rdata = [[FEUserSigninRequest alloc] initWithUname:@"test" password:[@"123456" MD5] clienttype:@"1" clientversion:@"1.0" devtoken:[NSString UUID]];
    [[FEShopWebServiceManager sharedInstance] signin:rdata response:^(NSError *error, FEUserSigninResponse *response) {
        
    }];
}

- (IBAction)backPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
