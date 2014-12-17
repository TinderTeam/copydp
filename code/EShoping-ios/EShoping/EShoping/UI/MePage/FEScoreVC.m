//
//  FEScoreVC.m
//  EShoping
//
//  Created by Seven on 14-12-9.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEScoreVC.h"
#import "FESiginVC.h"
#import "CDCustomerUser.h"
#import "CDUser.h"

@interface FEScoreVC ()<FESigninVCDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *scoreView;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation FEScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (FELoginUser) {
        self.scoreView.hidden = NO;
        self.scoreLabel.text = [NSString stringWithFormat:@"%@ 分",FELoginUser.usercustomer.score];
        
    }else{
        self.scoreView.hidden = YES;
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

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:@"scoreCell" forIndexPath:indexPath];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
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
