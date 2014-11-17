//
//  FEShopingHomeVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingHomeVC.h"
#import "FECitySelectVC.h"

@interface FEShopingHomeVC ()
@property (strong, nonatomic) IBOutlet UITableView *shopingTableView;

@end

@implementation FEShopingHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self initUI];
}

-(void)initUI{
    [self loadNavItemWithTitle:FEString(@"Location") image:nil target:self action:@selector(gotoLocation:) direction:FENavItemLeftDirection];
}

-(void)gotoLocation:(id)sender{
    FECitySelectVC *city = [FECitySelectVC new];
    [self presentViewController:city animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
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
