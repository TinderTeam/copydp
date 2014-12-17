//
//  FEProductOrderVC.m
//  EShoping
//
//  Created by Seven on 14-11-29.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductOrderVC.h"
#import "FEShopWebServiceManager.h"
#import "FEProductCreateOrderRequest.h"
#import "FEProductCreateOrderResponse.h"
#import "AppDelegate.h"
#import "FECoreDataHandler.h"
#import "FEProduct.h"
#import "CDUser.h"
#import "FEShopCheckView.h"
#import "FEProductOrderDetailVC.h"

@interface FEProductOrderVC ()<UIScrollViewDelegate,FEShopCheckViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *productPerPrice;
@property (strong, nonatomic) UIView *footerView;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIButton *submitButton;
@property (strong, nonatomic) IBOutlet FEShopCheckView *checkProductView;
@property (strong, nonatomic) IBOutlet UILabel *totalPayLabel;

@end

@implementation FEProductOrderVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = FEString(@"提交订单");
    self.checkProductView.delegate = self;
    self.checkProductView.number = 1;
    
    self.productPerPrice.text = [NSString stringWithFormat:@"￥ %@",self.product.price];
    self.totalPayLabel.text = [NSString stringWithFormat:@"￥ %.2f",[self.product.price floatValue] * self.checkProductView.number];
    
}

- (IBAction)submitOrder:(id)sender {
    if (FELoginUser) {
        [self.checkProductView resignFirstResponder];
        [self displayHUD:FEString(@"订购中...")];
        __weak typeof(self) weakself = self;
        FEProductCreateOrderRequest *rdata = [[FEProductCreateOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue productID:self.product.product_id.integerValue quantity:self.checkProductView.number orderid:nil];
        [[FEShopWebServiceManager sharedInstance] productOrderCreate:rdata response:^(NSError *error, FEProductCreateOrderResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                NSLog(@"order sucess!");
                [weakself performSegueWithIdentifier:@"showOrderDetailSegue" sender:response.productOrder];
            }
            [weakself hideHUD:YES];
        }];
    }else{
        [self performSegueWithIdentifier:@"productOrderToSignin" sender:sender];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showOrderDetailSegue"]) {
        FEProductOrderDetailVC *odetail = segue.destinationViewController;
        odetail.order = sender;
    }
}

#pragma mark - UITableViewDataSource
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        if (!self.footerView) {
            self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
            self.footerView.userInteractionEnabled = YES;
            self.submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.submitButton setTitle:FEString(@"提交订单") forState:UIControlStateNormal];
            self.submitButton.frame = CGRectMake((self.footerView.bounds.size.width - 200) / 2, 10, 200, 35);
            [self.submitButton setBackgroundImage:[UIImage imageFromColor:FEThemeOrange] forState:UIControlStateNormal];
            [self.submitButton addTarget:self action:@selector(submitOrder:) forControlEvents:UIControlEventTouchUpInside];
            self.submitButton.layer.cornerRadius = 4;
            self.submitButton.layer.masksToBounds = YES;

            [self.footerView addSubview:self.submitButton];
        }
        return self.footerView;
    }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.product.name;
}

#pragma mark - FEShopCheckViewDelegate
-(void)checkViewDidChange:(NSInteger)count{
    self.totalPayLabel.text = [NSString stringWithFormat:@"￥ %.2f",[self.product.price floatValue] * count];
}

#pragma mark - UIScrollerViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.checkProductView resignFirstResponder];
}


@end
