//
//  FEActivityTableViewCell.h
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FEActivity;

@interface FEActivityTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *activityImageView;
@property (strong, nonatomic) IBOutlet UILabel *activityTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *activityDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *activityJoinLabel;
@property (strong, nonatomic, readonly) FEActivity *activity;
@property (strong, nonatomic) IBOutlet UILabel *limitDateLabel;

-(void)configWithActivity:(FEActivity *)activity;

@end
