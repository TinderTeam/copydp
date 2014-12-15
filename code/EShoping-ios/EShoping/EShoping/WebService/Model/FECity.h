//
//  FECity.h
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FECity : FEObject
@property (nonatomic, strong, readonly) NSNumber *city_id;
@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSString *x;
@property (nonatomic, strong, readonly) NSString *y;
@property (nonatomic, strong, readonly) NSArray *zone_list;

@end
