//
//  FEProductOrderDetailVC.m
//  EShoping
//
//  Created by Seven on 14-12-17.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductOrderDetailVC.h"
#import "FEProductOrder.h"

@interface FEProductOrderDetailVC ()<UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *orderNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderNumberLabel;

@end

@implementation FEProductOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.orderCountLabel.text = [NSString stringWithFormat:@"%@ 份",self.order.quantity];
    self.orderNameLabel.text = self.order.order_name;
    self.orderNumberLabel.text = self.order.order_id;
}
- (IBAction)backPress:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 0) {
        [self backPress:nil];
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
