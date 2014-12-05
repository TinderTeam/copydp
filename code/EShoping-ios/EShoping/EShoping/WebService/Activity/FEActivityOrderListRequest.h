//
//  FEActivityOrderListRequest.h
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEActivityOrderListRequest : FEBaseRequest
@property (nonatomic, strong, readonly) NSNumber *userID;

-(id)initWithUserID:(NSNumber *)uid;

@end
