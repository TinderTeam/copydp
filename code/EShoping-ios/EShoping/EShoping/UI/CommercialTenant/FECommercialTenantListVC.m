//
//  FECommercialTenantListVC.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECommercialTenantListVC.h"
#import "FECTCTableViewCell.h"

@interface FECommercialTenantListVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation FECommercialTenantListVC

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UITabBarItem *tabitem = [[UITabBarItem alloc] initWithTitle:FEString(@"商户") image:[UIImage imageNamed:@"tabbar_activity_normal"] selectedImage:[UIImage imageNamed:@"tabbar_activity_pressed"]];
        self.tabBarItem = tabitem;
        self.title = FEString(@"联盟商户");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        FECTCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ctItemTableCell" forIndexPath:indexPath];
        return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
