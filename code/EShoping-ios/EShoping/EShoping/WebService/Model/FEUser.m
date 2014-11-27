//
//  FEUser.m
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEUser.h"

@implementation FEUser

-(id)initWithUserName:(NSString *)uname password:(NSString *)psw{
    self = [super init];
    if (self) {
        _password = psw;
        _username = uname;
    }
    return self;
}

@end
