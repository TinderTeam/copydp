//
//  FEProductOrderRequest.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEProductOrderRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSNumber *userID;

-(id)initWithUid:(NSInteger)userid;

@end
