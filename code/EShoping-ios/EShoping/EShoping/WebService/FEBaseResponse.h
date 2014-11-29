//
//  FEBaseResponse.h
//  EShoping
//
//  Created by Seven on 14-11-26.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"
#import "FEResult.h"

@interface FEBaseResponse : FEObject

@property (nonatomic, strong, readonly) FEResult *result;
-(id)initWithResponse:(id)response;
@end
