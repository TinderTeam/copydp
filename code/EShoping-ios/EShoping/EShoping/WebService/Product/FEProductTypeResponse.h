//
//  FEProductTypeResponse.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"
@class FEProductType;

@interface FEProductTypeResponse : FEBaseResponse
@property (nonatomic, strong, readonly) NSArray *typeList;
@end
