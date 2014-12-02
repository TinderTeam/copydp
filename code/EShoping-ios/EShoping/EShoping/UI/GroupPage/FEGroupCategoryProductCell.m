//
//  FEGroupCategoryProductCell.m
//  EShoping
//
//  Created by Seven on 14-12-1.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEGroupCategoryProductCell.h"

@implementation FEGroupCategoryProductCell

- (void)awakeFromNib {
    // Initialization code
    self.productPriceLabel.textColor = FEThemeOrange;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
