//
//  FECommercialTenantListVC.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECommercialTenantListVC.h"
#import "FECTItemTableViewCell.h"
#import "FEProductGetSellerListResponse.h"
#import "FEProductGetSellerListRequest.h"
#import "FEShopWebServiceManager.h"
#import "FECTItemDetailVC.h"

@interface FECommercialTenantListVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet FETableView *sellerTableView;
@property (nonatomic, strong) NSArray *sellerList;

@end

@implementation FECommercialTenantListVC

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UITabBarItem *tabitem = [[UITabBarItem alloc] initWithTitle:FEString(@"商户") image:[UIImage imageNamed:@"tabbar_activity_normal"] selectedImage:[UIImage imageNamed:@"tabbar_activity_pressed"]];
        self.tabBarItem = tabitem;
        self.title = FEString(@"联盟商户");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestSellers];
}

-(void)requestSellers{
    __weak typeof(self) weakself = self;
    FEProductGetSellerListRequest *rdata = [[FEProductGetSellerListRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO zoneId:0];
    [[FEShopWebServiceManager sharedInstance] productGetSellerList:rdata response:^(NSError *error, FEProductGetSellerListResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.sellerList = response.sellerList;
            [weakself.sellerTableView reloadData];
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FECTItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ctItemTableCell" forIndexPath:indexPath];
    [cell configWithSeller:self.sellerList[indexPath.row]];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sellerList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[FECTItemTableViewCell class]]) {
        FECTItemTableViewCell *cell = (FECTItemTableViewCell *)sender;
        FECTItemDetailVC *vc = (FECTItemDetailVC *)segue.destinationViewController;
        vc.seller = cell.seller;
    }
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
