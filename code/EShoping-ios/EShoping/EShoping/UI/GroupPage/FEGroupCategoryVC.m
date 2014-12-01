//
//  FEGroupCategoryVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryVC.h"
#import "DOPDropDownMenu.h"

@interface FEGroupCategoryVC ()<UISearchBarDelegate,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>
@property (strong, nonatomic) IBOutlet UITableView *GroupTableView;
@property (strong, nonatomic) NSArray *categoryArray;
@property (strong, nonatomic) NSArray *regoinArray;
@property (strong, nonatomic) NSArray *sortArray;

@end

@implementation FEGroupCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.categoryArray = [NSArray arrayWithObjects:@"全部分类",@"餐饮美食",@"汽车服务",@"摄影写真",@"教育培训",@"休闲娱乐",@"酒店旅游",@"都市丽人",@"生活服务", nil];
    self.regoinArray = [NSArray arrayWithObjects:@"全部商圈",@"工业园区",@"平江区",@"高新区",@"吴中区",@"金阊区", nil];
    self.sortArray = @[@"只能排序",@"离我最近",@"人气最高",@"评分最高",@"最新发布",@"价格最低",@"价格最高"];
    
    FESearchBar *searchBar = [[FESearchBar alloc] initWithFrame:CGRectMake(0, 0, 250, 40)];
    searchBar.barStyle = UIBarStyleBlack;
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    [self initUI];
}

-(void)initUI{
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:40];
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
