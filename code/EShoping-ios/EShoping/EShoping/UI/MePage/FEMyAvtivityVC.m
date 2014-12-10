//
//  FEMyAvtivityVC.m
//  EShoping
//
//  Created by Seven on 14-12-9.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEMyAvtivityVC.h"
#import "FEMyActivityCell.h"
#import "FEActivityOrderListRequest.h"
#import "FEActivityOrderListResponse.h"
#import "FEShopWebServiceManager.h"
#import "CDUser.h"
#import "FESiginVC.h"

@interface FEMyAvtivityVC ()<UITableViewDataSource, UITableViewDelegate,FESigninVCDelegate>
@property (strong, nonatomic) IBOutlet FETableView *myactivityTableView;
@property (strong, nonatomic) NSArray *myactivityList;

@end

@implementation FEMyAvtivityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = FEString(@"我的活动");
    if (FELoginUser) {
        [self requestActivity];
    }else{
        [self performSegueWithIdentifier:@"userSiginSegue" sender:nil];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nc = segue.destinationViewController;
    FESiginVC *vc = (FESiginVC *)nc.topViewController;
    vc.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)requestActivity{
    __weak typeof(self) weakself = self;
    FEActivityOrderListRequest *rdata = [[FEActivityOrderListRequest alloc] initWithUserID:FELoginUser.user_id];
    [[FEShopWebServiceManager sharedInstance] activityOrderList:rdata response:^(NSError *error, FEActivityOrderListResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.myactivityList = response.orderList;
            [weakself.myactivityTableView reloadData];
        }
    }];
}

#pragma mark - FESigninVCDelegate
-(void)signinVCDidSignin:(BOOL)isSignin{
    if (isSignin) {
        [self requestActivity];
    }else{
        [self.navigationController popViewControllerAnimated:NO];
    }
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FEMyActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myOrderActivityCell" forIndexPath:indexPath];
    [cell configWithActivity:self.myactivityList[indexPath.row]];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myactivityList.count;
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
