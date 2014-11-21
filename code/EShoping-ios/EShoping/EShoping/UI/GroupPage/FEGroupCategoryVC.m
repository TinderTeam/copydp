//
//  FEGroupCategoryVC.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryVC.h"

@interface FEGroupCategoryVC ()<UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *GroupTableView;

@end

@implementation FEGroupCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 250, 40)];
    searchBar.barStyle = UIBarStyleBlack;
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
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
