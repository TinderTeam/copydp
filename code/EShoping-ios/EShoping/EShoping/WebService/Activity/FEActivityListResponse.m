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
        NSArray *activitys = response[@"activityList"];
        if (activitys && ![activitys isKindOfClass:[NSNull class]]) {
            NSMutableArray *activityList = [NSMutableArray new];
            for (id item in activitys) {
                [activityList addObject:[[FEActivity alloc] initWithDictionary:item]];
            }
            _activityList = activityList;
        }
    }
    return self;
}

@end
