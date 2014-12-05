//
//  FEActivityOrderCreateResponse.h
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"

@class FEActivityOrder;

@interface FEActivityOrderCreateResponse : FEBaseResponse
@property (nonatomic, strong, readonly) FEActivityOrder *activityOrder;

@end
