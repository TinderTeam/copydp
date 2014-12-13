//
//  FEMyActivityCell.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEMyActivityCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FEActivityOrder.h"

@implementation FEMyActivityCell

-(void)awakeFromNib{
    
}

- (IBAction)activityOperation:(id)sender {
    if ([self.delegate respondsToSelector:@selector(activityCell:willCancel:)]) {
        [self.delegate activityCell:self willCancel:self.activity];
    }
}

-(void)configWithActivity:(FEActivityOrder *)activity{
    _activity = activity;
    [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(activity.imgsrc)] placeholderImage:nil];
    self.activityTitleLabel.text = activity.activity_title;
    self.limitLabel.text = [NSString stringWithFormat:@"限制人数:%@",activity.memberlimit];
    self.activityStatusLabel.text = activity.status;
    
}

@end
