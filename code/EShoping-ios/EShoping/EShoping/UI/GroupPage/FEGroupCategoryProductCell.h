//
//  FEGroupCategoryProductCell.h
//  EShoping
//
//  Created by Seven on 14-12-1.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FEProduct;
@interface FEGroupCategoryProductCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *productPriceLabel;

@property (strong, nonatomic, readonly) FEProduct *product;

-(void)configWithProduct:(FEProduct *)product;

@end
