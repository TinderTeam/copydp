//
//  FEShopingHomeVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingHomeVC.h"
#import "FECitySelectVC.h"
#import "FEShopingFuncCell.h"
#import "FEShopingItemCell.h"
#import "FEShopWebServiceManager.h"
#import "FEProductAllResponse.h"
#import "FEProductGetAllRequest.h"
#import "FEResult.h"
#import "FEProduct.h"

@interface FEShopingHomeVC ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *shopingTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *productList;

@end

@implementation FEShopingHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    [self requestAllproduct];
}

-(void)initUI{
    self.navigationController.navigationBar.barTintColor = FEThemeColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
//    FESearchBar *searchBar = [[FESearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
//    searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
}

-(void)gotoLocation:(id)sender{
    FECitySelectVC *city = [FECitySelectVC new];
    [self presentViewController:city animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"categorySegue"]) {
        
    }
}

-(void)requestAllproduct{
    __weak typeof(self) weakself = self;
    FEProductGetAllRequest *rdate = [[FEProductGetAllRequest alloc] initWithCity:@"深圳" type:0 keyword:nil isSearch:NO];
    [[FEShopWebServiceManager sharedInstance] productAll:rdate response:^(NSError *error, FEProductAllResponse *response) {
//        NSLog(@"");
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.productList = response.productList;
            [weakself.shopingTableView reloadData];
        }
    }];
    
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FEShopingFuncCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingCategory" forIndexPath:indexPath];
        return cell;
    }else{
        FEShopingItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingItem" forIndexPath:indexPath];
        [cell configWithProduct:self.productList[indexPath.row]];
        return cell;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.productList.count;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 190;
    }
    return 120;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

//#pragma mark - SpSearchbarDelegate
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
//    
//    searchBar.showsScopeBar = YES;
//    [searchBar sizeToFit];
//    [searchBar setShowsCancelButton:YES animated:YES];
//    return YES;
//}
//
//-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
//    return YES;
//}
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    [searchBar resignFirstResponder];
//    [self enableCancelButton:searchBar];
//}
//
//- (void)enableCancelButton:(UISearchBar *)searchBar
//{
//    for (UIView *view in searchBar.subviews)
//    {
//        for (id subview in view.subviews)
//        {
//            if ( [subview isKindOfClass:[UIButton class]] )
//            {
//                [subview setEnabled:YES];
//                return;
//            }
//        }
//    }
//}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
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
