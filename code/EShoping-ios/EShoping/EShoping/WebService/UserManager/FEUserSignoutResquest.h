//
//  FEUserSignoutResquest.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEUserSignoutResquest : FEBaseRequest

@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *clientType;
@property (nonatomic, strong, readonly) NSString *clientVersion;
@property (nonatomic, strong, readonly) NSString *devToken;

-(id)initWithUname:(NSString *)uname;

@end
