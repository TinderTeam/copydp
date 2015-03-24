//
//  FECTItemTableViewCell.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECTItemTableViewCell.h"
#import "FEShopSeller.h"

@implementation FECTItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.itemImageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)configWithSeller:(FEShopSeller *)seller{
    _seller = seller;
    [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:kImageURL(seller.img)]];
    self.titleLabel.text = seller.seller_name;
    self.descriptionLabel.text = seller.dscr;
    self.typeLabel.text = seller.type_name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
