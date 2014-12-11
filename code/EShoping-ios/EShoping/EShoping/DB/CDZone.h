//
//  CDZone.h
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDCity;

@interface CDZone : NSManagedObject

@property (nonatomic, retain) NSNumber * zone_id;
@property (nonatomic, retain) NSString * zone_name;
@property (nonatomic, retain) NSNumber * city_id;
@property (nonatomic, retain) CDCity *city;

@end
