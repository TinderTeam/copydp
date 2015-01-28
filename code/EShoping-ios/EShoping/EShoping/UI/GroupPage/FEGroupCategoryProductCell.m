//
//  FEGroupCategoryProductCell.m
//  EShoping
//
//  Created by Seven on 14-12-1.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryProductCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FEProduct.h"

@implementation FEGroupCategoryProductCell

- (void)awakeFromNib {
    // Initialization code
    self.productPriceLabel.textColor = FEThemeOrange;
}

-(void)configWithProduct:(FEProduct *)product{
    _product = product;
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:kImageURL(product.imgsrc)]];
    self.productDescriptionLabel.text = product.dscr;
    self.productPriceLabel.text = [NSString stringWithFormat:@"￥%@",product.price];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
