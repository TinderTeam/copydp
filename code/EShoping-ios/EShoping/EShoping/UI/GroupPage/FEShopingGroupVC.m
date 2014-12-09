//
//  FEShopingGroupVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingGroupVC.h"
#import "FEGroupCategoryCell.h"
#import "FEGroupProductCell.h"
#import "FESegmentControl.h"
#import "FEProductNewRequest.h"
#import "FEProductNewResponse.h"
#import "FEProductType.h"
#import "FEProductTypeRequest.h"
#import "FEProductTypeResponse.h"
#import "FEProduct.h"
#import "FEShopWebServiceManager.h"
#import "FEShopingItemVC.h"
#import "FEProductTypeRecRequest.h"
#import "FEProductTypeRecResponse.h"
#import "FEShopingGroupCollectionCell.h"
#import "FEGroupCategoryVC.h"

@interface FEShopingGroupVC ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>{
    BOOL _productRecommendBecome;
}
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *regionBarItem;
@property (strong, nonatomic) FESegmentControl *segment;
@property (strong, nonatomic) IBOutlet UITableView *productsTableView;

@property (strong, nonatomic) NSArray *productNew;
@property (strong, nonatomic) NSArray *productTypeRecommed;

@end

@implementation FEShopingGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
//    [self requestNewProduct];
//    [self requestTypeRecommend];
    __weak typeof(self) weakself = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:FERegionCityDidChang object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        weakself.regionBarItem.title = FEUserDefaultsObjectForKey(FEShopRegionKey);
//        [weakself requestNewProduct];
//        [weakself requestTypeRecommend];
    }];
    [self requestRecommend];
}

-(void)requestRecommend{
    __weak typeof(self) weakself = self;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        FEProductNewRequest *rdata = [[FEProductNewRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
        [[FEShopWebServiceManager sharedInstance] productNew:rdata response:^(NSError *error, FEProductNewResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                weakself.productNew = response.productList;
            }
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        FEProductTypeRecRequest *rdata = [[FEProductTypeRecRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
        [[FEShopWebServiceManager sharedInstance] productRecommedType:rdata response:^(NSError *error, FEProductTypeRecResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                weakself.productTypeRecommed = response.productList;
            }
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        _productRecommendBecome = YES;
        [weakself.productsTableView reloadData];
//        [weakself.productsTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
    });
}

-(void)initUI{
    self.regionBarItem.title = FEUserDefaultsObjectForKey(FEShopRegionKey);
    self.navigationController.navigationBar.barTintColor = FEThemeWhite;
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.barStyle = UIBarStyleBlack;
    self.navigationItem.titleView = self.searchBar;
    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
    self.navigationItem.leftBarButtonItem = self.regionBarItem;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showProductItem"]){
        FEShopingItemVC *productVC = (FEShopingItemVC *)segue.destinationViewController;
        productVC.product = ((FEGroupProductCell *)sender).product;
    }else if([sender isKindOfClass:[FEShopingGroupCollectionCell class]]){
        CDCategory *category = ((FEShopingGroupCollectionCell *)sender).productcategory;
        FEGroupCategoryVC *vc = segue.destinationViewController;
        vc.productcategory = category;
    }

}

-(void)requestNewProduct{
    __weak typeof(self) weakself = self;
    FEProductNewRequest *rdata = [[FEProductNewRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
    [[FEShopWebServiceManager sharedInstance] productNew:rdata response:^(NSError *error, FEProductNewResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.productNew = response.productList;
            [weakself.productsTableView reloadData];
        }
    }];
}

-(void)requestTypeRecommend{
    __weak typeof(self) weakself = self;
    FEProductTypeRecRequest *rdata = [[FEProductTypeRecRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
    [[FEShopWebServiceManager sharedInstance] productRecommedType:rdata response:^(NSError *error, FEProductTypeRecResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.productTypeRecommed = response.productList;
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.productsTableView) {
        if (indexPath.section == 0) {
            FEGroupCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingGoupCategoryCell" forIndexPath:indexPath];
            return cell;
        }else{
            FEGroupProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupProductCell" forIndexPath:indexPath];
            FEProduct *product;
            switch (self.segment.selectedSegmentIndex) {
                case 0:
                    product = self.productNew[indexPath.row];
                    break;
                case 1:
                    product = self.productTypeRecommed[indexPath.row];
                    break;
                case 2:
                    product = self.productTypeRecommed[indexPath.row];
                    break;
                default:
                    break;
            }
            [cell configWithProduct:product];
            return cell;
        }
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"1";
        return cell;
    }
    
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.productsTableView) {
        if (section == 0) {
            return 1;
        }else if(section == 1){
            switch (self.segment.selectedSegmentIndex) {
                case 0:
                    return self.productNew.count;
                case 1:
                    return self.productTypeRecommed.count;
                case 2:
                    return self.productTypeRecommed.count;
                default:
                    return 0;
            }
        }
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.productsTableView) {
        return _productRecommendBecome?2:1;
    }else{
        return 1;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView == self.productsTableView) {
        if (section == 1) {
            if (!self.segment) {
                _segment = [[FESegmentControl alloc] initWithSectionTitles:@[@"最新上架",@"分类推荐",@"搜索热门"]];
                _segment.font = FEFont(14);//[UIFont systemFontOfSize:14];
                _segment.selectedTextColor = FEThemeOrange;
                _segment.selectionIndicatorColor = FEThemeOrange;
                _segment.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
                _segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
                _segment.selectionIndicatorHeight = 2;
                [_segment addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
            }
            return self.segment;
        }
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.productsTableView) {
        if (section == 1) {
            return 44;
        }
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (tableView == self.productsTableView) {
        if (section == 1) {
            return 0;
        }else{
            return 20;
        }
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.productsTableView) {
        CGFloat height = 0;
        if (indexPath.section == 0) {
            height = 150;
        }else if(indexPath.section == 1){
            height = 120;
        }
        return height;
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        return 44;
    }
    return 44;
}

-(void)segmentedControlChangedValue:(FESegmentControl *)seg{
    [self.productsTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UISearchDisplayControllerdelegate methods
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
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
    self.navigationItem.leftBarButtonItem = self.regionBarItem;
    
}

-(void)filterContentForSearchText:(NSString*)searchText {
   
    
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
