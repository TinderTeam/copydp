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

@end

@implementation FECitySelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _city = [NSMutableArray new];
    NSArray *citys = [NSMutableArray arrayWithObjects:@"苏州",@"上海",@"深圳",@"武汉",@"广州",@"郑州",@"南昌",@"青岛",@"西宁",@"乌鲁木齐",@"天津",@"北京", nil];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *sortedarray = [NSMutableArray arrayWithArray:[citys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
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
    static NSString *identifier = @"city";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _city[indexPath.section][CITYS][indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_city[section][CITYS] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _city.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
//    NSMutableArray *toBeReturned = [[NSMutableArray alloc]init];
    
//    for(char c = 'A';c<='Z';c++)
//        
//        [toBeReturned addObject:[NSString stringWithFormat:@"%c",c]];
    
    return [_city valueForKey:FIRSTLETTER];
    
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    
    return [_city[index][CITYS] count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return _city[section][FIRSTLETTER];
    
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(cityDidSelectedCode:)]) {
        [self.delegate cityDidSelectedCode:_city[indexPath.section][CITYS][indexPath.row]];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchDisplayControllerdelegate methods
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    self.searchBar.transform = CGAffineTransformMakeTranslation(0, 0);
}
- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller  {
    [controller.searchResultsTableView setDelegate:self];
    controller.searchResultsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    //    self.searchBar.transform = CGAffineTransformMakeTranslation(0, 0);
    //    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString *)searchString {
    //    [self filterContentForSearchText:searchString];
    return YES;
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
    //    self.searchTable = tableView;
    //    [tableView setContentInset:UIEdgeInsetsZero];
    //    [tableView setScrollIndicatorInsets:UIEdgeInsetsZero];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
    //    [self.searchBar resignFirstResponder];
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
