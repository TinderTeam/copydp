//
//  FESellerProductItemCell.h
//  EShoping
//
//  Created by Seven on 15-1-6.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FEProduct;

@interface FESellerProductItemCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) IBOutlet UILabel *productTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (strong, nonatomic, readonly) FEProduct *product;

-(void)configWithProduct:(FEProduct *)product;

@end
