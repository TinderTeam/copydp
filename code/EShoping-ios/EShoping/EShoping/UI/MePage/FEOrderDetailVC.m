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
#import "FEResult.h"
#import "CDUser.h"

@interface FEOrderDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *orderList;
@property (nonatomic,strong) NSArray *orderDatas;
@end

@implementation FEOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestOrder];
}

-(void)requestOrder{
    __weak typeof(self) weakself = self;
    FEProductOrderRequest *rdata = [[FEProductOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue];
    [[FEShopWebServiceManager sharedInstance] productOrder:rdata response:^(NSError *error, FEProductOrderResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.orderDatas = response.orderList;
            [weakself.orderList reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FEOrderItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderProductCell" forIndexPath:indexPath];
    [cell configWithProduct:self.orderDatas[indexPath.row]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.orderDatas.count;
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
