//
//  FEActivity.h
//  EShoping
//
//  Created by Seven on 14-11-30.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEActivity : FEObject

@property (nonatomic, strong) NSNumber *activity_id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *datetime;
@property (nonatomic, strong) NSString *dscr;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *info;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *city_id;
@property (nonatomic, strong) NSString *datelimit;
@property (nonatomic, strong) NSString *current_member;
@property (nonatomic, strong) NSString *memberlimit;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *point;


@end
