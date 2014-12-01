//
//  FEProductType.h
//  EShoping
//
//  Created by Seven on 14-11-30.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEProductType : FEObject

@property (nonatomic, strong, readonly) NSNumber *type_id;
@property (nonatomic, strong, readonly) NSString *type_name;
@property (nonatomic, strong, readonly) NSNumber *father_id;

@end
