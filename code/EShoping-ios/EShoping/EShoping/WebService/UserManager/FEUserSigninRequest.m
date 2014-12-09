//
//  FEUserSigninRequest.m
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEUserSigninRequest.h"

@implementation FEUserSigninRequest

-(id)initWithUname:(NSString *)uname password:(NSString *)psw clienttype:(NSString *)ctype clientversion:(NSString *)cversion devtoken:(NSString *)dtoken{
    self = [super initWithMothed:__METHOD_SIGIN];
    if (self) {
        _username = uname;
        _password = psw;
        _clientType = ctype;
        _clientVersion = cversion;
        _devToken = dtoken;
    }
    return self;
}

@end
