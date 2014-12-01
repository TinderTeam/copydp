//
//  FEActivity.h
//  EShoping
//
//  Created by Seven on 14-11-30.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEActivity : FEObject

@property (nonatomic, strong, readonly) NSNumber *activity_id;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *datetime;
@property (nonatomic, strong, readonly) NSString *dscr;
@property (nonatomic, strong, readonly) NSString *address;
@property (nonatomic, strong, readonly) NSString *info;
@property (nonatomic, strong, readonly) NSString *note;
@property (nonatomic, strong, readonly) NSString *status;
@property (nonatomic, strong, readonly) NSString *city_id;
@property (nonatomic, strong, readonly) NSString *datelimit;
@property (nonatomic, strong, readonly) NSString *memberlimit;
@property (nonatomic, strong, readonly) NSString *imgsrc;
@property (nonatomic, strong, readonly) NSString *point;


@end
