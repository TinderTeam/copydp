//
//  FEOrderItemTableViewCell.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEOrderItemTableViewCell.h"
#import "FEProductOrder.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation FEOrderItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configWithProduct:(FEProductOrder *)product{
    self.orderProductDescription.text = product.product_description;
    [self.orderProductImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(product.imgsrc)]];
    self.orderProductNameLabel.text = product.product_name;
    self.orderProductStatusLabel.text = product.order_status;
    
}

@end
