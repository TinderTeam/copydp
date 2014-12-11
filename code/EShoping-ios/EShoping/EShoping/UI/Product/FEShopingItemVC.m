//
//  FEShopingItemVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#define __CELL_TYPE @"type"
#define __CELL_HIGHT @"height"
#define __CELL_CONTENT @"content"

#import "FEShopingItemVC.h"
#import "FEProductImageTableViewCell.h"
#import "FEProductOrderView.h"
#import "FEProductOrderVC.h"
#import "FEProduct.h"

@interface FEShopingItemVC ()<UITableViewDelegate,UITableViewDataSource,FEProductOrderViewDelegate>

@property (nonatomic, strong) FEProductOrderView *orderView;

@property (nonatomic, strong) NSMutableArray *productInfo;

@end

@implementation FEShopingItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _productInfo = [NSMutableArray new];
    NSArray *s = @[@"商家介绍",@"特惠详情",@"商户位置",@"购买须知",@"商户评价"];
//    NSArray *info = @[@{__CELL_TYPE:@(1),__CELL_HIGHT:@(50)}];
    for (NSString *str in s) {
        NSDictionary *info = @{__CELL_TYPE:@(0),__CELL_HIGHT:@(30),__CELL_CONTENT:str};
        NSDictionary *info1 = @{__CELL_TYPE:@(0),__CELL_HIGHT:@(20),__CELL_CONTENT:@""};
        [_productInfo addObject:info];
        [_productInfo addObject:info1];
    }
    
    [self initUI];
    
    
    
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productSectionTitle" forIndexPath:indexPath];
        cell.textLabel.text = _productInfo[indexPath.row][__CELL_CONTENT];
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
