//
//  FECitySelectVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECitySelectVC.h"
#import "FECoreDataHandler.h"
#import "CDCity.h"
#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import <ZBUtilities/UIDevice+ZBUtilites.h>
#import "FEGetCurrentCity.h"

#define FIRSTLETTER @"key"
#define CITYS       @"citys"

@interface FECitySelectVC ()<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>{
    NSMutableArray *_city;
}
@property (strong, nonatomic) IBOutlet UITableView *cityTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *searchResult;
@property (strong, nonatomic) NSArray *allcitys;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) FEGetCurrentCity *getCurrentCity;

@end

@implementation FECitySelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _city = [NSMutableArray new];
    _allcitys = [FECoreData fetchCity];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    for (int i = 0; i < 27; i++) {
        unichar ch = i + 65;
        NSString *key = [NSString stringWithFormat:@"%c",ch];
        if (i == 26) {
            key = @"#";
        }
        NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"SELF.citypinin contains[cd] %@",key];
        NSArray *filltercitys = [_allcitys filteredArrayUsingPredicate:userPredicate];
        if (filltercitys.count) {
            [_city addObject:@{FIRSTLETTER:key,CITYS:filltercitys}];
        }
    }
    
//    self.getCurrentCity = [[FEGetCurrentCity alloc] init];
//    [self.getCurrentCity getCity:^(NSError *error, NSString *city) {
//        if (!error) {
//            NSLog(@"get city success - %@",city);
//        }else{
//            NSLog(@"get city error %@",error);
//        }
//    }];
   
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusAuthorizedAlways) {
        [manager startUpdatingLocation];
    }
}


#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        static NSString *identifier = @"result";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = ((CDCity *)self.searchResult[indexPath.row]).cityititle;
        return cell;
    }else{
        static NSString *identifier = @"city";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
//        if(indexPath.section == 0){
//            cell.textLabel.text = @"定位城市";
//        }else{
            cell.textLabel.text = ((CDCity *)_city[indexPath.section][CITYS][indexPath.row]).cityititle;
//        }
        
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
//        if (section == 0) {
//            return 1;
//        }else{
        return [_city[section][CITYS] count];
//        }
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
        NSMutableArray *a = [NSMutableArray array];
        [a addObject:@""];
        [a addObjectsFromArray:[_city valueForKey:FIRSTLETTER]];
        return a;
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 0;
    }else{
        return index;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }else{
//        if (section == 0) {
//            return @"";
//        }else{
            return _city[section][FIRSTLETTER];
//        }
        
    }
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        FEUserDefaultsSetObjectForKey(((CDCity *)self.searchResult[indexPath.row]).cityititle, FEShopRegionKey);
    }else{
//        if (indexPath.section == 0) {
//            return;
//        }
        FEUserDefaultsSetObjectForKey(((CDCity *)_city[indexPath.section][CITYS][indexPath.row]).cityititle, FEShopRegionKey);
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
    NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"SELF.cityititle contains[cd] %@",searchText];
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
