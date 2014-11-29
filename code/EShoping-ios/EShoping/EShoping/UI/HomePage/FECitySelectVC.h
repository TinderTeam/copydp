//
//  FECitySelectVC.h
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECommonViewController.h"

@protocol FECitySelectVCDelegate <NSObject>

@optional
-(void)cityDidSelectedCode:(NSString *)city;

@end

@interface FECitySelectVC : FECommonViewController
@property (nonatomic, weak) id<FECitySelectVCDelegate> delegate;
- (IBAction)backPress:(UIBarButtonItem *)sender;

@end
