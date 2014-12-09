//
//  FEShopingGroupCollectionCell.h
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDCategory;

@interface FEShopingGroupCollectionCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic, readonly) CDCategory *productcategory;

-(void)configwithCategory:(CDCategory *)category;

@end
