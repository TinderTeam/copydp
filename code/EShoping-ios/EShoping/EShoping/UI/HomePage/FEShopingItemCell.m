//
//  FEShopingItemCell.m
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingItemCell.h"
#import "FEProduct.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FEShopingItemCell ()
@property (strong, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) IBOutlet UILabel *productNameLabel;

@end

@implementation FEShopingItemCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)configWithProduct:(FEProduct *)product{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://163.125.247.80:7000/copydp/%@",product.imgsrc]] placeholderImage:nil];
    self.productNameLabel.text = product.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
