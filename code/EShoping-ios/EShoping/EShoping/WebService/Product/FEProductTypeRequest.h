//
//  FEProductTypeRequest.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEProductTypeRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSNumber *typeRoot;

-(id)initWithTypeRoot:(NSInteger)typeRoot;

@end
