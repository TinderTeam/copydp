//
//  FECommunityTopicResponse.m
//  EShoping
//
//  Created by Seven on 14-12-6.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECommunityTopicResponse.h"
#import "FECommunityTopic.h"

@implementation FECommunityTopicResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        NSArray *discussSum = response[@"communityDiscussSum"];
        if (discussSum && ![discussSum isKindOfClass:[NSNull class]]) {
            NSMutableArray *communityDiscussSum = [NSMutableArray new];
            for (id item in discussSum) {
                [communityDiscussSum addObject:[[FECommunityTopic alloc] initWithDictionary:item]];
            }
            _communityDiscussSum = communityDiscussSum;
        }
    }
    return self;
}

@end
