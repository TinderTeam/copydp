//
//  FEOrderItemDetaiVC.m
//  EShoping
//
//  Created by Seven on 15-1-9.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEOrderItemDetaiVC.h"
#import "FEProductOrder.h"
#import "FEShopWebServiceManager.h"
#import "FEProductOrderCancelResponse.h"
#import "FEProductCancelOrderRequest.h"
#import "FEProductDeleteOrderRequest.h"
#import "FEProductDeleteOrderResponse.h"
#import "FECTItemDetailVC.h"
#import "FECoreDataHandler.h"
#import "CDUser.h"

@interface FEOrderItemDetaiVC ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *actionTitleLabel;

@end

@implementation FEOrderItemDetaiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:kImageURL(self.order.imgsrc)]];
    self.titleLabel.text = self.order.product_name;
    self.numberLabel.text = self.order.quantity.stringValue;
    self.priceLabel.text = self.order.order_price.stringValue;
    self.orderNumberLabel.text = self.order.order_id;
    self.orderTimeLabel.text = self.order.order_time;
    if ([self.order.order_status isEqualToString:@"已下单"]) {
        self.actionTitleLabel.text = FEString(@"取消订单");
    }else if([self.order.order_status isEqualToString:@"已使用"] || [self.order.order_status isEqualToString:@"已取消"] || [self.order.order_status isEqualToString:@"已过期"]) {
        self.actionTitleLabel.text = FEString(@"删除订单");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if ([self.order.order_status isEqualToString:@"已下单"]) {
            [self requestCancelOrder:self.order];
        }else if([self.order.order_status isEqualToString:@"已使用"] || [self.order.order_status isEqualToString:@"已取消"] || [self.order.order_status isEqualToString:@"已过期"]) {
            [self requestDeletOrder:self.order];
        }
        
    }
}

-(void)requestCancelOrder:(FEProductOrder *)order{
    __weak typeof(self) weakself = self;
    [self displayHUD:FEString(@"取消中...")];
    FEProductCancelOrderRequest *rdata = [[FEProductCancelOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue productID:order.product_id.integerValue quantity:order.quantity.integerValue orderid:order.order_id];
    [[FEShopWebServiceManager sharedInstance] productOrderCancel:rdata response:^(NSError *error, FEProductOrderCancelResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            [weakself.navigationController popViewControllerAnimated:YES];
            if ([weakself.delegate respondsToSelector:@selector(orderDidCancel:)]) {
                [weakself.delegate orderDidCancel:weakself.order];
            }
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
            [weakself.navigationController popViewControllerAnimated:YES];
            if ([weakself.delegate respondsToSelector:@selector(orderDidDelete:)]) {
                [weakself.delegate orderDidDelete:weakself.order];
            }
        }
        [weakself hideHUD:YES];
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    FECTItemDetailVC *vc = segue.destinationViewController;
    vc.sellerID = self.order.seller_id;
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
