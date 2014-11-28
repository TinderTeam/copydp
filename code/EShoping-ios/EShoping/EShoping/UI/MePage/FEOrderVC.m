//
//  FEOrderVC.m
//  EShoping
//
//  Created by Seven on 14-11-17.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEOrderVC.h"
#import "AppDelegate.h"
#import "FECoreDataHandler.h"

@interface FEOrderVC ()<UITableViewDelegate>

@end

@implementation FEOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0 && indexPath.row == 0) {
    if (!FELoginUser) {
        [self performSegueWithIdentifier:@"orderToSigninSegue" sender:tableView];
    }else{
        [self performSegueWithIdentifier:@"orderDetailSegue" sender:tableView];
    }
    
//    }else if(indexPath.section)
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
