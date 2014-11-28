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

@end

@implementation FEShopingItemCell

- (void)awakeFromNib {
    // Initialization cod
    self.productImageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)configWithProduct:(FEProduct *)product{
    
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/copydp/Public/uploads/img/%@",__WEB_SERVICE_IP,product.imgsrc]] placeholderImage:[UIImage imageNamed:@"profile.png"]];
    self.productNameLabel.text = product.name;
    self.productDescriptionLabel.text = product.dscr;
    self.productValueLabel.text = [NSString stringWithFormat:@"￥%@",product.price];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
