//
//  FEUserSignoutResquest.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEUserSignoutResquest.h"

@implementation FEUserSignoutResquest

-(id)initWithUname:(NSString *)uname{
    self = [super initWithMothed:__METHOD_SIGOUT];
    if (self) {
        _username = uname;
    }
    return self;
}

@end
