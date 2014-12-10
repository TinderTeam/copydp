//
//  FEActivityTableViewCell.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FEActivity.h"

@implementation FEActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.activityDescriptionLabel.numberOfLines = 0;
}


-(void)configWithActivity:(FEActivity *)activity{
    _activity = activity;
    [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(activity.imgsrc)] placeholderImage:nil];
    self.activityDescriptionLabel.text = activity.dscr;
    self.activityTitleLabel.text = activity.title;
    self.activityJoinLabel.text = [NSString stringWithFormat:@"参与人数: 0/%@",activity.memberlimit] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
