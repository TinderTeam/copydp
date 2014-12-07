//
//  FEGroupCategoryVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#define _CKEY @"key"
#define _CATECORY @"category"

#import "FEGroupCategoryVC.h"
#import "DOPDropDownMenu.h"
#import "FEGroupCategoryProductCell.h"
#import "FEProductAllResponse.h"
#import "FEProductGetAllRequest.h"
#import "FEShopWebServiceManager.h"
#import "FEShopingItemVC.h"
#import "FEShopCategory.h"

@interface FEGroupCategoryVC ()<UISearchBarDelegate,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *groupTableView;
@property (strong, nonatomic) NSArray *categoryArray;
@property (strong, nonatomic) NSArray *regoinArray;
@property (strong, nonatomic) NSArray *sortArray;
@property (strong, nonatomic) NSArray *categoryContentArray;

@property (strong, nonatomic) NSArray *productDatas;


@end

@implementation FEGroupCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.categoryArray = @[
                          @{_CKEY:@"全部分类"},
                          @{_CKEY:@"餐饮美食",_CATECORY:@[@"火锅海鲜",@"自助餐",@"日韩料理",@"甜品糕点",@"中西美食",@"家常小炒"]},
                          @{_CKEY:@"汽车服务",_CATECORY:@[@"洗车行",@"装饰美容",@"维护保养",@"二手车行",@"驾校培训"]},
                          @{_CKEY:@"摄影写真"},
                          @{_CKEY:@"教育培训"},
                          @{_CKEY:@"休闲娱乐",_CATECORY:@[@"酒吧KTV",@"保健按摩",@"足道浴场",@"影音欣赏",@"茶式咖啡馆",@"运动户外"]},
                          @{_CKEY:@"酒店旅游"},
                          @{_CKEY:@"都市丽人"},
                          @{_CKEY:@"生活服务"}];
    
    self.regoinArray = @[
                         @{_CKEY:@"全部商圈"},
                         @{_CKEY:@"工业园区"},
                         @{_CKEY:@"平江区"},
                         @{_CKEY:@"吴中区"},
                         @{_CKEY:@"金阊区"}];
    self.sortArray = @[
                       @{_CKEY:@"智能排序"},
                       @{_CKEY:@"离我最近"},
                       @{_CKEY:@"人气最高"},
                       @{_CKEY:@"评分最高"},
                       @{_CKEY:@"价格最低"},
                       @{_CKEY:@"价格最高"}];
    self.categoryContentArray = @[self.categoryArray,self.regoinArray,self.sortArray];

    [self initUI];
    [self requestProduct];
}

-(void)initUI{
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:40];
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
}

-(void)requestProduct{
    __weak typeof(self) weakself = self;
    FEProductGetAllRequest *rdata = [[FEProductGetAllRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:1 keyword:nil isSearch:NO];
    [[FEShopWebServiceManager sharedInstance] productAll:rdata response:^(NSError *error, FEProductAllResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.productDatas = response.productList;
            [weakself.groupTableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showProductItem"]){
        FEShopingItemVC *productVC = (FEShopingItemVC *)segue.destinationViewController;
        productVC.product = ((FEGroupCategoryProductCell *)sender).product;
    }
}

#pragma mark - DOPDropDownMenuDataSource
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column{

    return [self.categoryContentArray[column] count];
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath{
    return self.categoryContentArray[indexPath.column][indexPath.row][_CKEY];
}

-(NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInSubSelectRow:(DOPIndexPath *)indexPath{
    return [self.categoryContentArray[indexPath.column][indexPath.row][_CATECORY] count];
}

-(NSString *)menu:(DOPDropDownMenu *)menu titleForSubRowAtIndexPath:(DOPIndexPath *)indexPath subrowAtIndex:(NSInteger)index{
    return self.categoryContentArray[indexPath.column][indexPath.row][_CATECORY][index];
}

-(BOOL)menu:(DOPDropDownMenu *)menu columRowHasSub:(DOPIndexPath *)indexPath{
    
    return self.categoryContentArray[indexPath.column][indexPath.row][_CATECORY]?YES:NO;
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu{
    return self.categoryContentArray.count;
}

#pragma mark - DOPDropDownMenuDelegate
-(void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath{
    
}

#pragma mark - UITableVieDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.groupTableView) {
        FEGroupCategoryProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupProductItemCell" forIndexPath:indexPath];
        [cell configWithProduct:self.productDatas[indexPath.row]];
        return cell;
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"search";
        return cell;
    }
    return nil;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.groupTableView) {
        return 1;
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.groupTableView) {
        return self.productDatas.count;
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    return 0;
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
