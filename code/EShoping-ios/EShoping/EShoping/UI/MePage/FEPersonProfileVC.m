//
//  FEPersonProfileVC.m
//  EShoping
//
//  Created by Seven on 14-11-19.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEPersonProfileVC.h"
#import "FECoreDataHandler.h"
#import "AppDelegate.h"
#import "FEShopWebServiceManager.h"
#import "FEUserSignoutResquest.h"
#import "CDUser.h"
#import "CDCustomerUser.h"
#import "FEResult.h"
#import "FEUserSignoutResponse.h"

@interface FEPersonProfileVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet FETableView *profileTableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *nickNameCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *myscoreCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *phomeNumberCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *emailCell;

@property (nonatomic, strong) UIView *footView;

@end

@implementation FEPersonProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = FEThemeWhite;
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
    self.title = FEString(@"个人资料");
    self.nickNameCell.detailTextLabel.text = FELoginUser.username;
    self.myscoreCell.detailTextLabel.text = [NSString stringWithFormat:@"%@ 分",FELoginUser.usercustomer.score];
    self.phomeNumberCell.detailTextLabel.text = FELoginUser.usercustomer.cellphone;
    self.emailCell.detailTextLabel.text = FELoginUser.usercustomer.email;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 1) {
        if (!self.footView) {
            UIView *footview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
            footview.userInteractionEnabled = YES;
            self.footView = footview;
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setBackgroundImage:[UIImage imageFromColor:FEThemeOrange] forState:UIControlStateNormal];
            btn.layer.cornerRadius = 4;
            btn.layer.masksToBounds = YES;
            [btn addTarget:self action:@selector(signout:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(40, (footview.bounds.size.height - 35.0) / 2.0f, self.view.bounds.size.width - 40.0 * 2, 35);
            [btn setTitle:FEString(@"退出账号") forState:UIControlStateNormal];
            [footview addSubview:btn];
        }
        return self.footView;
        
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 80;
    }
    return 0;
}

-(void)signout:(id)sender{
    __weak typeof(self) weakself = self;
    FEUserSignoutResquest *rdate = [[FEUserSignoutResquest alloc] initWithUname:FELoginUser.username];
    [[FEShopWebServiceManager sharedInstance] signout:rdate response:^(NSError *error, FEUserSignoutResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            [weakself.navigationController popViewControllerAnimated:YES];
            FEDeletUser();
            [[NSNotificationCenter defaultCenter] postNotificationName:FEUserStatDidChang object:nil];
        }
    }];
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
