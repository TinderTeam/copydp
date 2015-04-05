//
//  FESellerProductItemCell.m
//  EShoping
//
//  Created by Seven on 15-1-6.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FESellerProductItemCell.h"
#import "FEProduct.h"
#import "NSString+Number.h"

@implementation FESellerProductItemCell

- (void)awakeFromNib {
    // Initialization code
    self.productDescriptionLabel.numberOfLines = 0;
    self.productDescriptionLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.productImageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)configWithProduct:(FEProduct *)product{
    _product = product;
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:kImageURL(product.imgsrc)]];
    self.productDescriptionLabel.text = product.dscr;
    self.productTitleLabel.text = product.name;
    self.productPriceLabel.text = [NSString priceStringWithNumber:@(product.price.floatValue)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
