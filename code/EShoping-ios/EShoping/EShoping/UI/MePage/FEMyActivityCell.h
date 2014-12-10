//
//  FEMyActivityCell.h
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FEActivityOrder;

@interface FEMyActivityCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *activityImageView;
@property (strong, nonatomic) IBOutlet UILabel *activityTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *limitLabel;
@property (strong, nonatomic) IBOutlet UILabel *passTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *activityStatusLabel;
@property (strong, nonatomic) IBOutlet UIButton *activityActionBtn;
@property (nonatomic, strong, readonly) FEActivityOrder *activity;

-(void)configWithActivity:(FEActivityOrder *)activity;

@end
