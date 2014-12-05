//
//  FEActivityOrderListRequest.m
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityOrderListRequest.h"

@implementation FEActivityOrderListRequest

-(id)initWithUserID:(NSNumber *)uid{
    self = [super initWithMothed:__METHOD_ACTIVITY_ACTIVITYORDER];
    if (self) {
        _userID = uid;
    }
    return self;
}

@end
