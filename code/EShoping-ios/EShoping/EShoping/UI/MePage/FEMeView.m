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
    CDUser *user = FELoginUser;
    if (user) {
        self.nickNameLabel.text = user.username;
    }
}

@end
