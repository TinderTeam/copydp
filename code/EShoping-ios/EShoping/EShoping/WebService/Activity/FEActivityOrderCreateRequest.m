//
//  FEActivityOrderCreateRequest.m
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityOrderCreateRequest.h"

@implementation FEActivityOrderCreateRequest

-(id)initWithUserID:(NSInteger)uid activityID:(NSInteger)aid{
    self = [super initWithMothed:__METHOD_ACTIVITY_CREATEORDER];
    if (self) {
        _userID = @(uid);
        _activityID = @(aid);
    }
    return self;
}

@end
