//
//  FECTItemTableViewCell.h
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FEShopSeller;

@interface FECTItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong, readonly) FEShopSeller *seller;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;

-(void)configWithSeller:(FEShopSeller *)seller;

@end
