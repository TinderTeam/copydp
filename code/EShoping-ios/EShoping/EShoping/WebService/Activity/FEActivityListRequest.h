//
//  FEActivityListRequest.h
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEActivityListRequest : FEBaseRequest
@property (nonatomic, strong, readonly) NSString *city;

-(id)initWithCity:(NSString *)city;

@end
