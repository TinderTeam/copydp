//
//  FEFuncCollectionViewCell.h
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDCategory;

@interface FEFuncCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *funcIcon;
@property (strong, nonatomic) IBOutlet UILabel *funcTitle;
@property (strong, nonatomic, readonly) CDCategory *productCategory;

-(void)configWithCategory:(CDCategory *)category;

@end
