//
//  FEMeView.m
//  EShoping
//
//  Created by Seven on 14-11-16.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEMeView.h"
#import "AppDelegate.h"
#import "FECoreDataHandler.h"
#import "CDUser.h"


@implementation FEMeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    [super awakeFromNib];
    [self updateWithUser:nil];
}

-(void)updateWithUser:(FEUser *)user{
    CDUser *cuser = FELoginUser;
    if (cuser) {
        self.nickNameLabel.text = cuser.username;
    }else{
        self.nickNameLabel.text = FEString(@"点击登陆");
    }
    
    self.locationRegionLabel.text = [NSString stringWithFormat:@"常居地:%@",FEUserDefaultsObjectForKey(FEShopRegionKey)];
}

@end
