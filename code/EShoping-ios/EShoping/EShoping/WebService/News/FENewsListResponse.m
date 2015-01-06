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
        _newsList = [self getListFromObject:response[@"newsList"] class:[FENews class]];

    }
    return self;
}

@end
