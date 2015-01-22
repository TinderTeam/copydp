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
#import "FEActivityOrderCancelRequest.h"
#import "FEActivityOrderCreateResponse.h"
#import "FEShopWebServiceManager.h"
#import "CDUser.h"
#import "FESiginVC.h"
#import "FEActivity.h"
#import "FEActivityOrder.h"
#import "FEActivityDeltailVC.h"

@interface FEMyAvtivityVC ()<UITableViewDataSource, UITableViewDelegate,FESigninVCDelegate,FEMyActivityCellDelegate>
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
    if ([segue.identifier isEqualToString:@"userSiginSegue"]) {
        UINavigationController *nc = segue.destinationViewController;
        FESiginVC *vc = (FESiginVC *)nc.topViewController;
        vc.delegate = self;
    }else{
        FEMyActivityCell *cell = sender;
        FEActivityDeltailVC *vc = segue.destinationViewController;
        
//        @property (nonatomic, strong, readonly) NSString *activity_order_id;
//        @property (nonatomic, strong, readonly) NSNumber *activity_id;
//        @property (nonatomic, strong, readonly) NSNumber *customer_id;
//        @property (nonatomic, strong, readonly) NSString *activity_title;
//        @property (nonatomic, strong, readonly) NSString *activity_disc;
//        @property (nonatomic, strong, readonly) NSString *imgsrc;
//        @property (nonatomic, strong, readonly) NSString *memberlimit;
//        @property (nonatomic, strong, readonly) NSNumber *datetime;
//        @property (nonatomic, strong, readonly) NSNumber *datelimit;
//        @property (nonatomic, strong, readonly) NSString *status;
//        @property (nonatomic, strong, readonly) NSString *activity_status;
//        @property (nonatomic, strong, readonly) NSString *username;
//        @property (nonatomic, strong, readonly) NSString *grade;
//        @property (nonatomic, strong, readonly) NSString *cellphone;
//        @property (nonatomic, strong, readonly) NSString *email;
//        
//        
//        @property (nonatomic, strong) NSNumber *activity_id;
//        @property (nonatomic, strong) NSString *title;
//        @property (nonatomic, strong) NSString *datetime;
//        @property (nonatomic, strong) NSString *dscr;
//        @property (nonatomic, strong) NSString *address;
//        @property (nonatomic, strong) NSString *info;
//        @property (nonatomic, strong) NSString *note;
//        @property (nonatomic, strong) NSString *status;
//        @property (nonatomic, strong) NSString *city_id;
//        @property (nonatomic, strong) NSString *datelimit;
//        @property (nonatomic, strong) NSString *current_member;
//        @property (nonatomic, strong) NSString *memberlimit;
//        @property (nonatomic, strong) NSString *imgsrc;
//        @property (nonatomic, strong) NSString *point;
        
        FEActivity *activity = [FEActivity new];
        activity.activity_id = cell.activity.activity_id;
        activity.title = cell.activity.activity_title;
        activity.datetime = cell.activity.datetime;
        activity.dscr = cell.activity.activity_disc;
//        activity.address = cell.activity.activity_id;
//        activity.info = cell.activity.activity_id;
        activity.status = cell.activity.status;
//        activity.city_id = cell.activity.activity_id;
        activity.datelimit = cell.activity.datelimit;
        activity.current_member = @"";
        activity.memberlimit = cell.activity.memberlimit;
        activity.imgsrc = cell.activity.imgsrc;
//        activity.point = cell.activity.activity_id;
        
        vc.activity = activity;//cell.activity;
    }
    
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

-(void)requestActivityCancel:(FEActivityOrder *)activity{
    [self displayHUD:FEString(@"取消中...")];
    __weak typeof(self) weakself = self;
    FEActivityOrderCancelRequest *rdate = [[FEActivityOrderCancelRequest alloc] initWithUserID:FELoginUser.user_id.integerValue activityID:activity.activity_id.integerValue];
    [[FEShopWebServiceManager sharedInstance] activityOrderCancel:rdate response:^(NSError *error, FEActivityOrderCreateResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            NSMutableArray *marray = [NSMutableArray arrayWithArray:weakself.myactivityList];
            [marray removeObject:activity];
            weakself.myactivityList = marray;
            [weakself.myactivityTableView reloadData];
        }
        [self hideHUD:YES];
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

#pragma mark - FEMyActivityCellDelegate
-(void)activityCell:(FEMyActivityCell *)cell willCancel:(FEActivityOrder *)activity{
    [self requestActivityCancel:activity];
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myactivityList.count) {
        FEMyActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myOrderActivityCell" forIndexPath:indexPath];
        cell.delegate = self;
        [cell configWithActivity:self.myactivityList[indexPath.row]];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noneActivityCell" forIndexPath:indexPath];
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!self.myactivityList.count) {
        return 1;
    }
    return self.myactivityList.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myactivityList.count) {
        return 90;
    }
    return 25;
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
