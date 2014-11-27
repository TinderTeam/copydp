//
//  FEResult.h
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEResult : FEObject
@property (nonatomic, strong, readonly) NSNumber *errorCode;
@property (nonatomic, strong, readonly) NSString *errorMsg;
@property (nonatomic, strong, readonly) NSString *obj;

@end
