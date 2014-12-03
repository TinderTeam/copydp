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
#import "FEProductRecommendResponse.h"
#import "FEProductRecommendRequest.h"
#import "FECommonNavgationController.h"
#import "FEShopingItemVC.h"
#import "FECitySelectVC.h"
#import "FEResult.h"
#import "FEProduct.h"

@interface FEShopingHomeVC ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate,FECitySelectVCDelegate>
@property (strong, nonatomic) IBOutlet UITableView *shopingTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *productList;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *regionBarItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *messageBarItem;

@end

@implementation FEShopingHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    __weak typeof(self) weakself = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:FERegionCityDidChang object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        weakself.regionBarItem.title = FEUserDefaultsObjectForKey(FEShopRegionKey);
        [weakself requestAllproduct];
    }];
    
    [self requestAllproduct];
}

-(void)initUI{
    [self.regionBarItem setTitle:FEUserDefaultsObjectForKey(FEShopRegionKey)];
//    self.navigationItem.titleView = self.searchBar;
    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
//    FESearchBar *searchBar = [[FESearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
//    searchBar.delegate = self;
//    self.navigationItem.titleView = self.searchBar;
    self.navigationItem.leftBarButtonItem = self.regionBarItem;
    self.navigationItem.rightBarButtonItem = self.messageBarItem;
}

-(void)gotoLocation:(id)sender{
    FECitySelectVC *city = [FECitySelectVC new];
    [self presentViewController:city animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"segue identifier %@",segue.identifier);
    if ([segue.identifier isEqualToString:@"categorySegue"]) {
        
    }else if([segue.identifier isEqualToString:@"showProductItem"]){
        FEShopingItemVC *productVC = (FEShopingItemVC *)segue.destinationViewController;
        productVC.product = ((FEShopingItemCell *)sender).product;
    }else if(sender == self.regionBarItem){
        FECitySelectVC *city = (FECitySelectVC *)((FECommonNavgationController *)segue.destinationViewController).topViewController;
        city.delegate =self;
    }
}

-(void)requestAllproduct{
    __weak typeof(self) weakself = self;
    FEProductRecommendRequest *rdata = [[FEProductRecommendRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
    [[FEShopWebServiceManager sharedInstance] productRecommedProduct:rdata response:^(NSError *error, FEProductRecommendResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.productList = response.productList;
            [weakself.shopingTableView reloadData];
        }

    }];
//    FEProductGetAllRequest *rdate = [[FEProductGetAllRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
//    [[FEShopWebServiceManager sharedInstance] productAll:rdate response:^(NSError *error, FEProductAllResponse *response) {
//        if (!error && response.result.errorCode.integerValue == 0) {
//            weakself.productList = response.productList;
//            [weakself.shopingTableView reloadData];
//        }
//    }];
    
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.shopingTableView) {
        if (indexPath.section == 0) {
            FEShopingFuncCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingCategory" forIndexPath:indexPath];
            return cell;
        }else{
            FEShopingItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingItem" forIndexPath:indexPath];
            [cell configWithProduct:self.productList[indexPath.row]];
            return cell;
        }
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        static NSString *identifier = @"search";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"1";
        return cell;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.shopingTableView) {
        return 2;
    }else{
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.shopingTableView) {
        if (section == 0) {
            return 1;
        }else{
            return self.productList.count;
        }
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    
    return 0;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return FEString(@"猜你喜欢");
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 20;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 190;
    }
    return 120;
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if (tableView == self.shopingTableView) {
//        return 20;
//    }
//    return 0;
//}

#pragma mark - UISearchDisplayControllerdelegate methods
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = nil;
}
- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller  {
    
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {

}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString];
    return YES;
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
    
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
    self.navigationItem.rightBarButtonItem = self.messageBarItem;
    self.navigationItem.leftBarButtonItem = self.regionBarItem;
    //        [self.searchBar resignFirstResponder];
}

-(void)filterContentForSearchText:(NSString*)searchText {
//    NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",searchText];
//    self.searchResult = [_allcitys filteredArrayUsingPredicate:userPredicate];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = FEThemeOrange;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
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
