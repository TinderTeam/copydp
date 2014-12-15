//
//  FEShopingItemVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

typedef enum : NSUInteger {
    CELL_SELLER_TITILE,
    CELL_SELLER_CONTENT_TEXT,
    CELL_SELLER_MAP,
    CELL_SELLER_NOTE,
//    CELL_SELLER_
} CELL_TYPE;

#define __CELL_TYPE @"type"
#define __CELL_HIGHT @"height"
#define __CELL_CONTENT @"content"
#define __CELL_XIB_NAME @"xib"

#import "FEShopingItemVC.h"
#import "FEProductImageTableViewCell.h"
#import "FEProductOrderView.h"
#import "FEProductOrderVC.h"
#import "FEProduct.h"
#import "FEProductGetSellerRequest.h"
#import "FEProductGetSellerResponse.h"
#import "FEShopWebServiceManager.h"
#import "FEMapView.h"
#import "FEProductNoteCell.h"


@interface FEShopingItemVC ()<UITableViewDelegate,UITableViewDataSource,FEProductOrderViewDelegate>

@property (nonatomic, strong) FEProductOrderView *orderView;
@property (strong, nonatomic) IBOutlet UITableView *productShowTableView;
@property (nonatomic, strong) NSMutableArray *productInfo;
@property (nonatomic, strong) FEShopSeller *seller;

@end

@implementation FEShopingItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initUI];
    [self requestSeller];
}

-(void)initUI{
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 30, 30);
    [btn1 setImage:[UIImage imageNamed:@"common_navi_bar_icon_share_rest"] forState:UIControlStateNormal];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 30, 30);
    [btn2 setImage:[UIImage imageNamed:@"common_navi_bar_icon_favorite_off_rest"] forState:UIControlStateNormal];
    
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    item1.style = UIBarButtonItemStyleBordered;
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    item2.style = UIBarButtonItemStyleBordered;
    self.navigationItem.rightBarButtonItems = @[item2,item1];
}

-(void)requestSeller{
    __weak typeof(self) weakself = self;
    FEProductGetSellerRequest *rdata = [[FEProductGetSellerRequest alloc] initWithSellerId:self.product.seller_id];
    [[FEShopWebServiceManager sharedInstance] productGetSeller:rdata response:^(NSError *error, FEProductGetSellerResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
//            NSLog(@"has seller info");
            
            _productInfo = [NSMutableArray new];
//            NSArray *s = @[@"商家介绍",@"特惠详情",@"商户位置",@"购买须知",@"商户评价"];
            NSDictionary *info = @{__CELL_TYPE:@(CELL_SELLER_TITILE), __CELL_XIB_NAME:@"productSectionTitle",__CELL_HIGHT:@(30),__CELL_CONTENT:FEString(@"商家介绍")};
            [_productInfo addObject:info];
            info = @{__CELL_TYPE:@(CELL_SELLER_CONTENT_TEXT),__CELL_XIB_NAME:@"sellerInfoCell",__CELL_HIGHT:@(50)};
            [_productInfo addObject:info];
//            info = @{__CELL_TYPE:@(CELL_SELLER_TITILE),__CELL_XIB_NAME:@"productSectionTitle",__CELL_HIGHT:@(30),__CELL_CONTENT:FEString(@"特惠详情")};
//            [_productInfo addObject:info];
            info = @{__CELL_TYPE:@(CELL_SELLER_TITILE),__CELL_XIB_NAME:@"productSectionTitle",__CELL_HIGHT:@(30),__CELL_CONTENT:FEString(@"商户位置")};
            [_productInfo addObject:info];
            info = @{__CELL_TYPE:@(CELL_SELLER_MAP),__CELL_XIB_NAME:@"mapCell",__CELL_HIGHT:@(150)};
            [_productInfo addObject:info];
            info = @{__CELL_TYPE:@(CELL_SELLER_TITILE),__CELL_XIB_NAME:@"productSectionTitle",__CELL_HIGHT:@(30),__CELL_CONTENT:FEString(@"购买须知")};
            [_productInfo addObject:info];
            info = @{__CELL_TYPE:@(CELL_SELLER_NOTE),__CELL_XIB_NAME:@"productNoteCell",__CELL_HIGHT:@(120)};
            [_productInfo addObject:info];
            
            weakself.seller = response.seller;
            [weakself.productShowTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
    
}


-(void)share:(id)sender{
    
}

-(void)collect:(id)sender{
    
}

-(void)viewWillAppear:(BOOL)animated{
//    self.navigationController.navigationBar setti
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableVieDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FEProductImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productImageTableCell" forIndexPath:indexPath];
        [cell configWithProduct:self.product];
        return cell;
    }else if(indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_productInfo[indexPath.row][__CELL_XIB_NAME] forIndexPath:indexPath];
        cell.textLabel.text = _productInfo[indexPath.row][__CELL_CONTENT];
        if ([_productInfo[indexPath.row][__CELL_TYPE] integerValue] == CELL_SELLER_MAP) {
            FEMapView *mapview = (FEMapView *)[cell viewWithTag:10];
            NSString *positon = self.seller.position;
            NSArray *pa = [positon componentsSeparatedByString:@","];
            if (pa.count == 2) {
                [mapview setPin:CLLocationCoordinate2DMake([pa[1] floatValue], [pa[0] floatValue])];
            }
            
        }else if([_productInfo[indexPath.row][__CELL_TYPE] integerValue] == CELL_SELLER_CONTENT_TEXT){
            cell.textLabel.text = self.seller.dscr;
        }else if([_productInfo[indexPath.row][__CELL_TYPE] integerValue] == CELL_SELLER_NOTE){
            [((FEProductNoteCell *)cell) configWithProduct:self.product];
        }
        return cell;
    }
    return nil;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return _productInfo.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 190;
    }else{
        return [_productInfo[indexPath.row][__CELL_HIGHT] floatValue];
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        if (!self.orderView) {
            _orderView = [[FEProductOrderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
            [_orderView configWithProduct:self.product];
            _orderView.delegate = self;
        }
        return self.orderView;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 50;
    }
    return 0;
}

#pragma mark - FEProductOrderViewDelegate
-(void)productOrderViewOrderSelect:(FEProductOrderView *)oview{
    [self performSegueWithIdentifier:@"productOrderSegue" sender:self.orderView];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"productOrderSegue"]) {
        FEProductOrderVC *ovc = (FEProductOrderVC *)segue.destinationViewController;
        ovc.product = ((FEProductOrderView *)sender).product;
    }
}

-(void)dealloc{
    
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
