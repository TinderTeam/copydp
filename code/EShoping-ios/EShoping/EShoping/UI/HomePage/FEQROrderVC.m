//
//  FEQROrderVC.m
//  EShoping
//
//  Created by Seven on 15-3-16.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEQROrderVC.h"
#import "FEShopWebServiceManager.h"
#import "FEProductGetSellerRequest.h"
#import "FEProductGetSellerResponse.h"
#import "FEProductCreateOrderRequest.h"
#import "FEProductCreateOrderResponse.h"
#import "AppDelegate.h"
#import "FECoreDataHandler.h"
#import "CDUser.h"
#import "FEProductOrderDetailVC.h"


@interface FEQROrderVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) FEShopSeller *seller;
@property (strong, nonatomic) IBOutlet FEButton *submitButton;

@end

@implementation FEQROrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = FEString(@"扫码消费");
    [self.submitButton setBackgroundImage:[UIImage imageFromColor:[UIColor orangeColor]] forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.submitButton.layer.cornerRadius = 3;
    self.submitButton.layer.masksToBounds = YES;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [self requestSellerDetail];
}

-(void)requestSellerDetail{
    __weak typeof(self) weakself = self;
    FEProductGetSellerRequest *rdata = [[FEProductGetSellerRequest alloc] initWithSellerId:@(self.sellerID.integerValue)];
    [[FEShopWebServiceManager sharedInstance] productGetSeller:rdata response:^(NSError *error, FEProductGetSellerResponse *response) {
        
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.seller = response.seller;
            [weakself.tableView reloadData];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}
- (IBAction)submit:(id)sender {
    if (FELoginUser) {
        __weak typeof(self) weakself = self;
        FEProductCreateOrderRequest *rdata = [[FEProductCreateOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue productID:0 quantity:1 sellerID:@(self.sellerID.integerValue) orderType:@"扫码下单"];
        [[FEShopWebServiceManager sharedInstance] productOrderCreate:rdata response:^(NSError *error, FEProductCreateOrderResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                NSLog(@"order sucess!");
                [weakself performSegueWithIdentifier:@"showOrderDetailSegue" sender:response.productOrder];
            }
            [weakself hideHUD:YES];
        }];
    }else{
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
    }
    //loginSegue

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showOrderDetailSegue"]){
        FEProductOrderDetailVC *odetail = segue.destinationViewController;
        odetail.order = sender;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *hView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
    hView.backgroundColor = [UIColor clearColor];
//    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(3, 0, self.view.bounds.size.width - 6, .5)];
//    line.backgroundColor = [UIColor grayColor];
//    [hView addSubview:line];
    
    FELabel *hLabel = [[FELabel alloc] initWithFrame:CGRectMake(15, 0, hView.bounds.size.width - 20, 30)];
    hLabel.font = [UIFont appFontWithSize:20];
    hLabel.textColor = [UIColor orangeColor];
    [hView addSubview:hLabel];
    if (section == 0) {
        hLabel.text = FEString(@"商家名称");
    }else if(section == 1){
        hLabel.text = FEString(@"商家描述");
    }
    return hView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *hView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 2)];
    hView.backgroundColor = [UIColor clearColor];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(3, 0, self.view.bounds.size.width - 6, .5)];
    line.backgroundColor = [UIColor grayColor];
    [hView addSubview:line];
    return hView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGSize size = [self.seller.seller_name boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 20, 999999) withTextFont:[UIFont appFontWithSize:13]];
        if (size.height < 50) {
            return 50;
        }else{
            return size.height + 30;
        }
        
    }else{
        CGSize size = [self.seller.dscr boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 20, 999999) withTextFont:[UIFont appFontWithSize:13]];
        if (size.height < 50) {
            return 50;
        }else{
            return size.height + 30;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellerInfoCell" forIndexPath:indexPath];
    
//    UIView *line = (UIView *)[cell viewWithTag:2];
    
    
    //    line.backgroundColor = [UIColor grayColor];
    //    [hView addSubview:line];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = self.seller.seller_name;
    }else{
        cell.textLabel.text = self.seller.dscr;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.seller) {
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
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
