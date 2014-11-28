//
//  FEOrderItemTableViewCell.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FEOrderItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *orderProductImageView;
@property (strong, nonatomic) IBOutlet UILabel *orderProductNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderProductDescription;
@property (strong, nonatomic) IBOutlet UILabel *orderProductStatusLabel;

@end
