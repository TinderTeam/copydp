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


@interface FERegistVC ()

@end

@implementation FERegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)regist:(id)sender {
    
    FEUser *user = [[FEUser alloc] initWithUserName:@"test" password:[@"123456" MD5]];
    FEUserRegistRequest *rdata = [[FEUserRegistRequest alloc] initWithUser:user customer:nil code:@""];
    [[FEShopWebServiceManager sharedInstance] regist:rdata response:^(NSError *error, FEUserRegistResponse *response) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
