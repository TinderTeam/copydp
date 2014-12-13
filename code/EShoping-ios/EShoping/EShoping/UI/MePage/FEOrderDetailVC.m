//
//  FEOrderDetailVC.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEOrderDetailVC.h"
#import "FEOrderItemTableViewCell.h"
#import "AppDelegate.h"
#import "FEShopWebServiceManager.h"
#import "FEProductOrderRequest.h"
#import "FEProductOrderResponse.h"
#import "FEProductCancelOrderRequest.h"
#import "FEProductOrderCancelResponse.h"
#import "FEProductDeleteOrderRequest.h"
#import "FEProductDeleteOrderResponse.h"
#import "FEResult.h"
#import "CDUser.h"
#import "FESegmentControl.h"
#import "FESiginVC.h"
#import "FEProductOrder.h"

@interface FEOrderDetailVC ()<UITableViewDelegate,UITableViewDataSource,FESigninVCDelegate,FEOrderItemTableViewCellDelegate>
@property (strong, nonatomic) IBOutlet UITableView *orderList;
@property (nonatomic,strong) NSArray *orderDatas;
@property (nonatomic, strong) NSArray *orderPlace;
@property (nonatomic, strong) NSArray *orderCancel;
@property (nonatomic, strong) NSArray *orderComplete;
@property (nonatomic, strong) FESegmentControl *orderTypeSeg;
@end

@implementation FEOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    if (FELoginUser) {
        [self requestOrder];
    }else{
        [self performSegueWithIdentifier:@"userSiginSegue" sender:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nc = segue.destinationViewController;
    FESiginVC *vc = (FESiginVC *)nc.topViewController;
    vc.delegate = self;
}

#pragma mark - FESigninVCDelegate
-(void)signinVCDidSignin:(BOOL)isSignin{
    if (isSignin) {
        [self requestOrder];
    }else{
        [self.navigationController popViewControllerAnimated:NO];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)initUI{
    self.title = FEString(@"我的订单");
    _orderTypeSeg = [[FESegmentControl alloc] initWithSectionTitles:@[@"已订购",@"已取消",@"已终止"]];
    _orderTypeSeg.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    _orderTypeSeg.font = FEFont(14);//[UIFont systemFontOfSize:14];
    _orderTypeSeg.selectedTextColor = FEThemeOrange;
    _orderTypeSeg.selectionIndicatorColor = FEThemeOrange;
    _orderTypeSeg.selectionStyle = HMSegmentedControlSelectionStyleArrow;
    _orderTypeSeg.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _orderTypeSeg.selectionIndicatorHeight = 8;
    [_orderTypeSeg addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_orderTypeSeg];
}

-(void)segmentedControlChangedValue:(FESegmentControl *)seg{
    [self.orderList reloadData];
}

-(void)requestOrder{
    __weak typeof(self) weakself = self;
    FEProductOrderRequest *rdata = [[FEProductOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue];
    [[FEShopWebServiceManager sharedInstance] productOrder:rdata response:^(NSError *error, FEProductOrderResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
//            weakself.orderDatas = response.orderList;
//            [weakself.orderList reloadData];
            weakself.orderPlace = [response.orderList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.order_status == %@",@"已下单"]];
            weakself.orderCancel = [response.orderList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.order_status == %@",@"已取消"]];
            [weakself.orderList reloadData];
        }
    }];
}


-(void)requestCancelOrder:(FEProductOrder *)order{
    __weak typeof(self) weakself = self;
    [self displayHUD:FEString(@"取消中...")];
    FEProductCancelOrderRequest *rdata = [[FEProductCancelOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue productID:order.product_id.integerValue quantity:order.quantity.integerValue orderid:order.order_id];
    [[FEShopWebServiceManager sharedInstance] productOrderCancel:rdata response:^(NSError *error, FEProductOrderCancelResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            NSMutableArray *tarray = [NSMutableArray arrayWithArray:weakself.orderPlace];
            [tarray removeObject:order];
            weakself.orderPlace = tarray;
            [weakself.orderList reloadData];
            [order setValue:@"已取消" forKey:@"order_status"];
            NSMutableArray *aarray = [NSMutableArray arrayWithArray:weakself.orderCancel];
            [aarray addObject:order];
            weakself.orderCancel = aarray;
        }
        [self hideHUD:YES];
    }];
}

-(void)requestDeletOrder:(FEProductOrder *)order{
    __weak typeof(self) weakself = self;
    [self displayHUD:FEString(@"删除中...")];
    FEProductDeleteOrderRequest *rdata = [[FEProductDeleteOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue productID:order.product_id.integerValue quantity:order.quantity.integerValue orderid:order.order_id];
    [[FEShopWebServiceManager sharedInstance] productOrderDelete:rdata response:^(NSError *error, FEProductDeleteOrderResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            NSMutableArray *tarray = [NSMutableArray arrayWithArray:weakself.orderCancel];
            [tarray removeObject:order];
            weakself.orderCancel = tarray;
            [weakself.orderList reloadData];
        }
        [self hideHUD:YES];
    }];
}


#pragma mark - FEOrderItemTableViewCellDelegate
-(void)orderWillDelete:(FEOrderItemTableViewCell *)cell order:(FEProductOrder *)order{
    [self requestDeletOrder:order];
}

-(void)orderWillCancel:(FEOrderItemTableViewCell *)cell order:(FEProductOrder *)order{
    [self requestCancelOrder:order];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FEOrderItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderProductCell" forIndexPath:indexPath];
    FEProductOrder *order;
    switch (self.orderTypeSeg.selectedSegmentIndex) {
        case 0:
            order = self.orderPlace[indexPath.row];
            break;
        case 1:
            order = self.orderCancel[indexPath.row];
            break;
        case 2:
            order = self.orderComplete[indexPath.row];
            break;
            
        default:
            break;
    }
    cell.delegate = self;
    [cell configWithProduct:order];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (self.orderTypeSeg.selectedSegmentIndex) {
        case 0:
            return self.orderPlace.count;
        case 1:
            return self.orderCancel.count;
        case 2:
            return self.orderComplete.count;
            
        default:
            break;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 80;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
