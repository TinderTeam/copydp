//
//  FEActivityDeltailVC.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityDeltailVC.h"
#import "FEActivityShowImageCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FEActivity.h"
#import "FEProductOrderView.h"
#import "FEShopWebServiceManager.h"
#import "FEActivityOrderCreateRequest.h"
#import "FEActivityOrderCreateResponse.h"
#import "FECoreDataHandler.h"
#import "AppDelegate.h"
#import "CDUser.h"

@interface FEActivityDeltailVC ()<UITableViewDataSource,UITableViewDelegate,FEProductOrderViewDelegate>
@property (strong, nonatomic) IBOutlet FETableView *activityDeltailTableView;
@property (strong, nonatomic) FEProductOrderView *orderView;
@property (strong, nonatomic) IBOutlet UILabel *activityDescription;
@property (strong, nonatomic) IBOutlet UILabel *avtivityAddressLabel;
@property (strong, nonatomic) IBOutlet UILabel *activityPointLabel;
@property (strong, nonatomic) IBOutlet UILabel *createTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *attachLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FEActivityDeltailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = self.activity.title;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text = self.activity.title;
    self.activityDescription.numberOfLines = 0;
    self.activityDescription.text = self.activity.dscr;
    self.avtivityAddressLabel.numberOfLines = 0;
    self.avtivityAddressLabel.text = self.activity.address;
    self.activityPointLabel.text = [NSString stringWithFormat:@"积分奖励： %@",self.activity.point];
    self.createTimeLabel.text = @"";//[NSString stringWithFormat:@"创建时间：%@",self.activity.datetime];
    self.attachLabel.text = @"";[NSString stringWithFormat:@"说明："];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FEActivityShowImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityImageCell" forIndexPath:indexPath];
        [cell.activityImageView sd_setImageWithURL:[NSURL URLWithString:kImageURL(self.activity.imgsrc)]];
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 50;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        if (!self.orderView) {
            _orderView = [[FEProductOrderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
            [_orderView configWithActivity:self.activity];
            _orderView.delegate = self;
        }
        return self.orderView;
    }
    return nil;
}

#pragma mark - FEProductOrderViewDelegate
-(void)productOrderViewOrderSelect:(FEProductOrderView *)oview{
    if (FELoginUser) {
        [self displayHUD:FEString(@"参加中...")];
        __weak typeof(self) weakself = self;
        FEActivityOrderCreateRequest *rdata = [[FEActivityOrderCreateRequest alloc] initWithUserID:[FELoginUser.user_id integerValue] activityID:[self.activity.activity_id integerValue]];
        [[FEShopWebServiceManager sharedInstance] activityOrderCreate:rdata response:^(NSError *error, FEActivityOrderCreateResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                
            }
            [weakself hideHUD:YES];
        }];
    }else{
        [self performSegueWithIdentifier:@"productOrderToSignin" sender:oview];
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
