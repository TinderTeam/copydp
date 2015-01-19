//
//  FEUserGradeRequest.m
//  EShoping
//
//  Created by Seven on 15-1-19.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEUserGradeRequest.h"

@implementation FEUserGradeRequest

-(id)initWithUser:(FEUser *)user{
    self = [super initWithMothed:__METHOD_USER_UPGRADE];
    if (self) {
        _user = user.dictionary;
    }
    return self;
}

@end
