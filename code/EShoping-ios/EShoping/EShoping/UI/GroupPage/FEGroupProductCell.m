//
//  FEGroupProductCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupProductCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FEProduct.h"

@interface FEGroupProductCell ()
@property (strong, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) IBOutlet UILabel *productTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *productPriceLabel;

@end

@implementation FEGroupProductCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)configWithProduct:(FEProduct *)product{
    _product = product;
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(product.imgsrc)]];
    self.productTitleLabel.text = product.name;
    self.productPriceLabel.text = [NSString stringWithFormat:@"￥%@",product.price];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
