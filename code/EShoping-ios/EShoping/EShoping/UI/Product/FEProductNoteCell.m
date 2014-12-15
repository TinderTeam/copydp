//
//  FEProductNoteCell.m
//  EShoping
//
//  Created by Seven on 14-12-14.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductNoteCell.h"
#import "FEProduct.h"

@implementation FEProductNoteCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configWithProduct:(FEProduct *)product{
    self.limitTimeLabel.text = product.end_date_time;
}

@end
