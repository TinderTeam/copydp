//
//  FEShopingCategoryVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingCategoryVC.h"

@interface FEShopingCategoryVC ()

@end

@implementation FEShopingCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[FEString(@"Store"),FEString(@"Group")]];
    seg.frame = CGRectMake(0, 0, 180, 30);
    seg.selectedSegmentIndex = 0;
    self.navigationItem.titleView = seg;
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
