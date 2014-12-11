//
//  FEZone.h
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEZone : FEObject

@property (nonatomic, strong, readonly) NSNumber *zone_id;
@property (nonatomic, strong, readonly) NSString *zone_name;
@property (nonatomic, strong, readonly) NSNumber *city_id;

@end
