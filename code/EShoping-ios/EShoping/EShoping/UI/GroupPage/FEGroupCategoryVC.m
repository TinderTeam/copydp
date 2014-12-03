//
//  FEGroupCategoryVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryVC.h"
#import "DOPDropDownMenu.h"
#import "FEGroupCategoryProductCell.h"
#import "FEProductAllResponse.h"
#import "FEProductGetAllRequest.h"
#import "FEShopWebServiceManager.h"

@interface FEGroupCategoryVC ()<UISearchBarDelegate,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *groupTableView;
@property (strong, nonatomic) NSArray *categoryArray;
@property (strong, nonatomic) NSArray *regoinArray;
@property (strong, nonatomic) NSArray *sortArray;

@property (strong, nonatomic) NSArray *productDatas;

@end

@implementation FEGroupCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.categoryArray = [NSArray arrayWithObjects:@"全部分类",@"餐饮美食",@"汽车服务",@"摄影写真",@"教育培训",@"休闲娱乐",@"酒店旅游",@"都市丽人",@"生活服务", nil];
    self.regoinArray = [NSArray arrayWithObjects:@"全部商圈",@"工业园区",@"平江区",@"高新区",@"吴中区",@"金阊区", nil];
    self.sortArray = @[@"智能排序",@"离我最近",@"人气最高",@"评分最高",@"最新发布",@"价格最低",@"价格最高"];

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
    FEProductGetAllRequest *rdata = [[FEProductGetAllRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
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

#pragma mark - DOPDropDownMenuDataSource
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column{
    switch (column) {
        case 0:
            return self.categoryArray.count;
        case 1:
            return self.regoinArray.count;
        case 2:
            return self.sortArray.count;
        default:
            return 0;
            break;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath{
    switch (indexPath.column) {
        case 0:
            return self.categoryArray[indexPath.row];
        case 1:
            return self.regoinArray[indexPath.row];
        case 2:
            return self.sortArray[indexPath.row];
            
        default:
            return @"";
            break;
    }
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu{
    return 3;
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
