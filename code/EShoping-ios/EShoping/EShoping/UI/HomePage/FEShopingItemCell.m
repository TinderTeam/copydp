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
@property (strong, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *productValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *productOriginPriceLabel;

@end

@implementation FEShopingItemCell

- (void)awakeFromNib {
    // Initialization cod
    self.productImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.productDescriptionLabel.numberOfLines = 0;
//    self.productDescriptionLabel
    
}

-(void)drawRect:(CGRect)rect{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 0.5);
//    
//    CGContextSetStrokeColorWithColor(context, FEColor(225, 225, 225, 1).CGColor);
//    
//    CGContextMoveToPoint(context, 0, 0);
//    
//    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
//    
//    //    CGContextSetStrokeColorWithColor(context, FEColor(225, 225, 225, 1).CGColor);
//    
//    CGContextMoveToPoint(context, 0, self.bounds.size.height - 0.5f);
//    
//    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height - 0.5);
//    
//    CGContextStrokePath(context);
}

-(void)configWithProduct:(FEProduct *)product{
    _product = product;
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(product.imgsrc)]];
    self.productNameLabel.text = product.name;
    self.productDescriptionLabel.text = product.dscr;
    self.productValueLabel.text = [NSString stringWithFormat:@"￥%@",product.price];
    if (product.original_price) {
        NSMutableAttributedString *astring = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@",product.original_price]];
        NSRange range = {1,astring.length - 1};
        [astring addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
        self.productOriginPriceLabel.attributedText = astring;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
