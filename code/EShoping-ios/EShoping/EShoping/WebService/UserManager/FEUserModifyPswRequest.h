//
//  FEUserModifyPswRequest.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEUserModifyPswRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *oldPwd;
@property (nonatomic, strong, readonly) NSString *pwdNew;

-(id)initWithUname:(NSString *)uname oldPassword:(NSString *)oldpsw newPassword:(NSString *)newpsw;

@end
