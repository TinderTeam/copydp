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
#import "FEProduct.h"
#import "FEShopWebServiceManager.h"
#import "FEShopingItemVC.h"

@interface FEShopingGroupVC ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *regionBarItem;
@property (strong, nonatomic) FESegmentControl *segment;
@property (strong, nonatomic) IBOutlet UITableView *productsTableView;

@property (strong, nonatomic) NSArray *productNew;

@end

@implementation FEShopingGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self requestNewProduct];
    __weak typeof(self) weakself = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:FERegionCityDidChang object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        weakself.regionBarItem.title = FEUserDefaultsObjectForKey(FEShopRegionKey);
    }];
}

-(void)initUI{
    self.regionBarItem.title = FEUserDefaultsObjectForKey(FEShopRegionKey);
    self.navigationController.navigationBar.barTintColor = FEThemeWhite;
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.barStyle = UIBarStyleBlack;
    self.navigationItem.titleView = self.searchBar;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showProductItem"]){
        FEShopingItemVC *productVC = (FEShopingItemVC *)segue.destinationViewController;
        productVC.product = ((FEGroupProductCell *)sender).product;
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
    if (indexPath.section == 0) {
        FEGroupCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingGoupCategoryCell" forIndexPath:indexPath];
        return cell;
    }else{
        FEGroupProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupProductCell" forIndexPath:indexPath];
        [cell configWithProduct:self.productNew[indexPath.row]];
        return cell;
    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return self.productNew.count;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        if (!self.segment) {
            _segment = [[FESegmentControl alloc] initWithSectionTitles:@[@"离你最近",@"最新上架",@"搜索热门"]];
            _segment.font = FEFont(14);//[UIFont systemFontOfSize:14];
            _segment.selectedTextColor = FEThemeOrange;
            _segment.selectionIndicatorColor = FEThemeOrange;
            _segment.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
            _segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
            _segment.selectionIndicatorHeight = 2;
        }
        return self.segment;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 44;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 0;
    }
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if (indexPath.section == 0) {
        height = 150;
    }else if(indexPath.section == 1){
        height = 120;
    }
    return height;
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
