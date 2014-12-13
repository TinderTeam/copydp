//
//  FEScoreVC.m
//  EShoping
//
//  Created by Seven on 14-12-9.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEScoreVC.h"
#import "FESiginVC.h"

@interface FEScoreVC ()<FESigninVCDelegate>

@end

@implementation FEScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (FELoginUser) {
       
    }else{
        [self performSegueWithIdentifier:@"userSiginSegue" sender:nil];
    }
    self.title = FEString(@"我的积分");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nc = segue.destinationViewController;
    FESiginVC *vc = (FESiginVC *)nc.topViewController;
    vc.delegate = self;
}

#pragma mark - FESigninVCDelegate
-(void)signinVCDidSignin:(BOOL)isSignin{
    if (isSignin) {
        
    }else{
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
