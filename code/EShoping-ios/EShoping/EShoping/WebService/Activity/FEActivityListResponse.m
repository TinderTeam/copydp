//
//  FEActivityListResponse.m
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityListResponse.h"
#import "FEActivity.h"

@implementation FEActivityListResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        
        _activityList = [self getListFromObject:response[@"activityList"] class:[FEActivity class]];
    }
    return self;
}

@end
