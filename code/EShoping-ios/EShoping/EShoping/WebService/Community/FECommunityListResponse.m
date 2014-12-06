//
//  FECommuntiyListResponse.m
//  EShoping
//
//  Created by Seven on 14-12-6.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECommunityListResponse.h"
#import "FECommunity.h"

@implementation FECommunityListResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        NSArray *community = response[@"communityList"];
        if (community && ![community isKindOfClass:[NSNull class]]) {
            NSMutableArray *communityList = [NSMutableArray new];
            for (id item in community) {
                [communityList addObject:[[FECommunity alloc] initWithDictionary:item]];
            }
            _communityList = communityList;
        }
    }
    return self;
}

@end
