//
//  FECTInfoTableCell.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECTInfoTableCell.h"
#import "FEShopSeller.h"

@implementation FECTInfoTableCell

- (void)awakeFromNib {
    // Initialization code
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.titleLabel.numberOfLines = 0;
    self.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
}

-(void)configWithSeller:(FEShopSeller *)seller{
    _seller = seller;
    [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:kImageURL(seller.img)]];
    self.titleLabel.text = seller.seller_name;
    self.descriptionLabel.text = seller.dscr;
    self.cityLabel.text = seller.city;
    self.regionLabel.text = seller.zone_name;
    self.categoryLabel.text = seller.type_name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
