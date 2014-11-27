//
//  FEUser.h
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseModel.h"

@interface FEUser : FEBaseModel

@property (nonatomic, strong, readonly) NSNumber *user_id;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *role;

-(id)initWithUserName:(NSString *)uname password:(NSString *)psw;

@end
