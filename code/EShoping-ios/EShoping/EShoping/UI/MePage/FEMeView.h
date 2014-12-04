//
//  FEMeView.h
//  EShoping
//
//  Created by Seven on 14-11-16.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FEUser;

@interface FEMeView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *headerImage;
@property (strong, nonatomic) IBOutlet UILabel *locationRegionLabel;
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;

-(void)updateWithUser:(FEUser *)user;

@end
