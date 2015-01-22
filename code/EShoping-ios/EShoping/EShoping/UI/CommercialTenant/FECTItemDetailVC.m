//
//  FECTItemDetailVC.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECTItemDetailVC.h"
#import "FECTInfoTableCell.h"
#import "FEShopWebServiceManager.h"
#import "FEProductGetSellerRequest.h"
#import "FEProductGetSellerResponse.h"
#import "FEShopSeller.h"
#import "FESellerProductItemCell.h"
#import "FESellerEvalCell.h"
#import "FEShopingItemVC.h"
#import "FEMapView.h"

@interface FECTItemDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet FETableView *infoTableView;
@property (strong, nonatomic) IBOutlet FEMapView *mapView;

@property (nonatomic, strong) NSMutableArray *allInfo;

@end

@implementation FECTItemDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.allInfo = [NSMutableArray new];
    if (self.seller) {
        [self.allInfo addObject:@[self.seller]];
    }
    [self requestSellerDetail];
}

-(void)requestSellerDetail{
    __weak typeof(self) weakself = self;
    NSNumber *sid;
    if (self.seller) {
        sid = self.seller.user_id;
    }else{
        sid = self.sellerID;
    }
    FEProductGetSellerRequest *rdata = [[FEProductGetSellerRequest alloc] initWithSellerId:sid];
    [[FEShopWebServiceManager sharedInstance] productGetSeller:rdata response:^(NSError *error, FEProductGetSellerResponse *response) {
        
        if (!error && response.result.errorCode.integerValue == 0) {
            [weakself.allInfo removeAllObjects];
            [weakself.allInfo addObject:@[response.seller]];
            weakself.seller = response.seller;
            NSString *positon = response.seller.position;
            NSArray *pa = [positon componentsSeparatedByString:@","];
            if (pa.count == 2) {
                [weakself.mapView setPin:CLLocationCoordinate2DMake([pa[1] floatValue], [pa[0] floatValue])];
            }
            
            if (response.productList) {
                [weakself.allInfo addObject:response.productList];
            }
            if (response.sellerEvalList) {
                [weakself.allInfo addObject:response.sellerEvalList];
            }
            [weakself.infoTableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = self.allInfo[indexPath.section][indexPath.row];
    if ([item isKindOfClass:[FEShopSeller class]]) {
        FECTInfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ctItemInfoCell" forIndexPath:indexPath];
        [cell configWithSeller:self.seller];
        return cell;
    }else if([item isKindOfClass:[FEProduct class]]){
        FESellerProductItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellerProductCell" forIndexPath:indexPath];
        [cell configWithProduct:item];
        return cell;
    }else if([item isKindOfClass:[FESellerEval class]]){
        FESellerEvalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellerEvalCell" forIndexPath:indexPath];
        cell.textLabel.text = ((FESellerEval *)item).eva_content;
        return cell;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = self.allInfo[indexPath.section][indexPath.row];
    if ([item isKindOfClass:[FEShopSeller class]]) {
//        FECTInfoTableCell *cell = (FECTInfoTableCell *)[tableView cellForRowAtIndexPath:indexPath];
//        CGFloat height = cell.categoryLabel.frame.origin.y + cell.categoryLabel.frame.size.height + 10;
        FEShopSeller *seller = item;
        CGSize size = [seller.dscr boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 20, 99999) withTextFont:[UIFont appFontWithSize:14]];
        return (160 - 15 + size.height);
    }else if([item isKindOfClass:[FEProduct class]]){
        return 70;
    }else if([item isKindOfClass:[FESellerEval class]]){
        return 55;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allInfo.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allInfo[section] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    id item = [self.allInfo[section] firstObject];
    if ([item isKindOfClass:[FEShopSeller class]]) {
        return FEString(@"商家信息");
    }else if([item isKindOfClass:[FEProduct class]]){
        return FEString(@"商户产品");
    }else if([item isKindOfClass:[FESellerEval class]]){
        return FEString(@"商户评价");
    }
    return nil;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[FESellerProductItemCell class]]) {
        FEShopingItemVC *vc = segue.destinationViewController;
        vc.product = ((FESellerProductItemCell *)sender).product;
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
