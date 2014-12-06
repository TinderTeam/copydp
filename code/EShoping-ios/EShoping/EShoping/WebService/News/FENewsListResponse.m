//
//  FENewsListResponse.m
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FENewsListResponse.h"
#import "FENews.h"

@implementation FENewsListResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        NSArray *news = response[@"newsList"];
        if (news && ![news isKindOfClass:[NSNull class]]) {
            NSMutableArray *newsList = [NSMutableArray new];
            for (id item in news) {
                [newsList addObject:[[FENews alloc] initWithDictionary:item]];
            }
            _newsList = newsList;
        }
    }
    return self;
}

@end
