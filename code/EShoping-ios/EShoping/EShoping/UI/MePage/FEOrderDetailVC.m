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
#import "FEOrderItemDetaiVC.h"

@interface FEOrderDetailVC ()<UITableViewDelegate,UITableViewDataSource,FESigninVCDelegate,FEOrderItemTableViewCellDelegate,FEOrderItemDetaiVCDelegate>
@property (strong, nonatomic) IBOutlet UITableView *orderList;
@property (nonatomic,strong) NSArray *orderDatas;
@property (nonatomic, strong) NSArray *orderPlace;
@property (nonatomic, strong) NSArray *orderCancel;
@property (nonatomic, strong) NSArray *orderComplete;
@property (nonatomic, strong) NSArray *orderPassed;
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
    if ([sender isKindOfClass:[FEOrderItemTableViewCell class]]) {
        FEOrderItemDetaiVC *vc = segue.destinationViewController;
        vc.order = ((FEOrderItemTableViewCell *)sender).order;
        vc.delegate = self;
        return;
    }
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
    _orderTypeSeg = [[FESegmentControl alloc] initWithSectionTitles:@[@"已订购",@"已使用",@"已取消",@"已过期"]];
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
            weakself.orderComplete = [response.orderList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.order_status == %@",@"已使用"]];
            weakself.orderCancel = [response.orderList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.order_status == %@",@"已取消"]];
            weakself.orderPassed = [response.orderList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.order_status == %@",@"已过期"]];
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
            [weakself cancelOrder:order];
        }
        [weakself hideHUD:YES];
    }];
}

-(void)requestDeletOrder:(FEProductOrder *)order{
    __weak typeof(self) weakself = self;
    [self displayHUD:FEString(@"删除中...")];
    FEProductDeleteOrderRequest *rdata = [[FEProductDeleteOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue productID:order.product_id.integerValue quantity:order.quantity.integerValue orderid:order.order_id];
    [[FEShopWebServiceManager sharedInstance] productOrderDelete:rdata response:^(NSError *error, FEProductDeleteOrderResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            [weakself deleteOrder:order];
        }
        [weakself hideHUD:YES];
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
            order = self.orderComplete[indexPath.row];
            break;
        case 2:
            order = self.orderCancel[indexPath.row];
            break;
        case 3:
            order = self.orderPassed[indexPath.row];
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
            return self.orderComplete.count;
        case 2:
            return self.orderCancel.count;
        case 3:
            return self.orderPassed.count;
        default:
            break;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark FEOrderItemDetailVCDelegate
-(void)orderDidCancel:(FEProductOrder *)order{
    [self cancelOrder:order];
}

-(void)orderDidDelete:(FEProductOrder *)order{
    [self deleteOrder:order];
}

-(void)cancelOrder:(FEProductOrder *)order{
    NSMutableArray *tarray = [NSMutableArray arrayWithArray:self.orderPlace];
    [tarray removeObject:order];
    self.orderPlace = tarray;
    [self.orderList reloadData];
    [order setValue:@"已取消" forKey:@"order_status"];
    NSMutableArray *aarray = [NSMutableArray arrayWithArray:self.orderCancel];
    [aarray addObject:order];
    self.orderCancel = aarray;
}

-(void)deleteOrder:(FEProductOrder *)order{
    if ([order.order_status isEqualToString:@"已过期"]) {
        NSMutableArray *tarray = [NSMutableArray arrayWithArray:self.orderPassed];
        [tarray removeObject:order];
        self.orderPassed = tarray;
    }else if([order.order_status isEqualToString:@"已取消"]){
        NSMutableArray *tarray = [NSMutableArray arrayWithArray:self.orderCancel];
        [tarray removeObject:order];
        self.orderCancel = tarray;
    }else if([order.order_status isEqualToString:@"已使用"]){
        NSMutableArray *tarray = [NSMutableArray arrayWithArray:self.orderComplete];
        [tarray removeObject:order];
        self.orderComplete = tarray;
    }
    [self.orderList reloadData];
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
