//
//  FEUserGradeRequest.h
//  EShoping
//
//  Created by Seven on 15-1-19.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"
#import "FEUser.h"

@interface FEUserGradeRequest : FEBaseRequest
@property (nonatomic, strong, readonly) NSDictionary *user;

-(id)initWithUser:(FEUser *)user;

@end
