//
//  FEShopingItemVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingItemVC.h"
#import "FEProductImageTableViewCell.h"
#import "FEProductOrderView.h"
#import "FEProductOrderVC.h"
#import "FEProduct.h"

@interface FEShopingItemVC ()<UITableViewDelegate,UITableViewDataSource,FEProductOrderViewDelegate>

@property (nonatomic, strong) FEProductOrderView *orderView;

@end

@implementation FEShopingItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableVieDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
        FEProductImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productImageTableCell" forIndexPath:indexPath];
        return cell;
//    }
    return nil;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 3;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
