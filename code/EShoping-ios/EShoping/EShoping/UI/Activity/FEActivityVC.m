//
//  FEActivityVC.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityVC.h"
#import "FEShopWebServiceManager.h"
#import "FEActivityListRequest.h"
#import "FEActivityListResponse.h"
#import "FEActivityTableViewCell.h"
#import "FEActivityDeltailVC.h"
#import <XHRefreshControl/XHRefreshControl.h>

@interface FEActivityVC ()<UITableViewDataSource,UITableViewDelegate,XHRefreshControlDelegate>
@property (strong, nonatomic) IBOutlet UITableView *activityTableView;
@property (strong, nonatomic) NSArray *activityList;
@property (strong, nonatomic) XHRefreshControl *refresh;

@end

@implementation FEActivityVC

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UITabBarItem *tabitem = [[UITabBarItem alloc] initWithTitle:FEString(@"活动") image:[UIImage imageNamed:@"tabbar_activity_normal"] selectedImage:[UIImage imageNamed:@"tabbar_activity_pressed"]];
        self.tabBarItem = tabitem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = FEString(@"活动");
    
    self.refresh = [[XHRefreshControl alloc] initWithScrollView:self.activityTableView delegate:self];
    
    
    __weak typeof(self) weakself = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:FERegionCityDidChang object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        weakself.activityList = nil;
        [weakself.activityTableView reloadData];
        [weakself requestActivity];
    }];
//    [self requestActivity];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    [self.refresh startPullDownRefreshing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestActivity{
    __weak typeof(self) weakself = self;
    FEActivityListRequest *rdata = [[FEActivityListRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey)];
    [[FEShopWebServiceManager sharedInstance] activityList:rdata response:^(NSError *error, FEActivityListResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.activityList = response.activityList;
            [weakself.activityTableView reloadData];
        }
        [weakself.refresh endPullDownRefreshing];
    }];
}

#pragma mark - XHRefreshControlDelegate
-(BOOL)isPullDownRefreshed{
    return YES;
}

/**
 *  获取是否下啦刷新中
 *
 *  @return 返回预期结果
 */
- (BOOL)isLoading{
    return [self.refresh isLoading];
}



- (void)beginPullDownRefreshing{
    self.activityList = nil;
    [self.activityTableView reloadData];
    [self requestActivity];
}

-(void)beginLoadMoreRefreshing{

}



#pragma mark - prepareForSegue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[FEActivityTableViewCell class]]) {
        FEActivityDeltailVC *vc = (FEActivityDeltailVC *)segue.destinationViewController;
        vc.activity = ((FEActivityTableViewCell *)sender).activity;
        
    }
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_activityList.count) {
        FEActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
        [cell configWithActivity:_activityList[indexPath.row]];
        return cell;
    }else{
        return [tableView dequeueReusableCellWithIdentifier:@"nonActivityCell" forIndexPath:indexPath];
    }
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_activityList.count) {
        return _activityList.count;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_activityList.count) {
        return 110;
    }
    return 30;
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
