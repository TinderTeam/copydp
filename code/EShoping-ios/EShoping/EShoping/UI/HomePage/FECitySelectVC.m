//
//  FECitySelectVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECitySelectVC.h"

#define FIRSTLETTER @"key"
#define CITYS       @"citys"

@interface FECitySelectVC ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_city;
}
@property (strong, nonatomic) IBOutlet UITableView *cityTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *searchResult;
@property (strong, nonatomic) NSArray *allcitys;

@end

@implementation FECitySelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _city = [NSMutableArray new];
    _allcitys = [NSMutableArray arrayWithObjects:@"苏州",@"上海",@"深圳",@"武汉",@"广州",@"郑州",@"南昌",@"青岛",@"西宁",@"乌鲁木齐",@"天津",@"北京", nil];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *sortedarray = [NSMutableArray arrayWithArray:[_allcitys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
        for (int i = 0; i < 27; i++) {
            unichar ch = i + 65;
            NSString *key = [NSString stringWithFormat:@"%c",ch];
            if (i == 26) {
                key = @"#";
            }
            
            NSMutableArray *citys = [[NSMutableArray alloc]init];
            for (NSString *city in sortedarray) {
                CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (CFStringRef)city);CFStringTransform(string, NULL, kCFStringTransformMandarinLatin,NO);
                CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
                NSString *pinyin = (__bridge NSString *)string;
                if (pinyin.length && [[[pinyin substringToIndex:1] uppercaseString] isEqualToString:key]) {
                    [citys addObject:city];
                }
            }
            if (citys.count) {
                [_city addObject:@{FIRSTLETTER:key,CITYS:citys}];
                [sortedarray removeObjectsInArray:citys];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.cityTableView reloadData];
        });
    
    });
   
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}


#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        static NSString *identifier = @"result";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = self.searchResult[indexPath.row];
        return cell;
    }else{
        static NSString *identifier = @"city";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = _city[indexPath.section][CITYS][indexPath.row];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return self.searchResult.count;
    }else{
        return [_city[section][CITYS] count];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 1;
    }else{
        return _city.count;
    }
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
//    NSMutableArray *toBeReturned = [[NSMutableArray alloc]init];
    
//    for(char c = 'A';c<='Z';c++)
//        
//        [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }else{
        return [_city valueForKey:FIRSTLETTER];
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [_city[index][CITYS] count];
    }else{
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }else{
        return _city[section][FIRSTLETTER];
    }
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        FEUserDefaultsSetObjectForKey(self.searchResult[indexPath.row], FEShopRegionKey);
    }else{
        FEUserDefaultsSetObjectForKey(_city[indexPath.section][CITYS][indexPath.row], FEShopRegionKey);
    }
    FEUserDefaultsSync;
    [[NSNotificationCenter defaultCenter] postNotificationName:FERegionCityDidChang object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchDisplayControllerdelegate methods
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
//    self.searchBar.transform = CGAffineTransformMakeTranslation(0, 64);
}
- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller  {
//    [controller.searchResultsTableView setDelegate:self];
//    controller.searchResultsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    //    self.searchBar.transform = CGAffineTransformMakeTranslation(0, 0);
    //    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString];
    return YES;
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
    //    self.searchTable = tableView;
//        [tableView setContentInset:UIEdgeInsetsZero];
//        [tableView setScrollIndicatorInsets:UIEdgeInsetsZero];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
//        [self.searchBar resignFirstResponder];
}

-(void)filterContentForSearchText:(NSString*)searchText {
    NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",searchText];
    self.searchResult = [_allcitys filteredArrayUsingPredicate:userPredicate];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backPress:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
