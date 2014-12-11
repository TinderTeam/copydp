//
//  CDCity.h
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDZone;

@interface CDCity : NSManagedObject

@property (nonatomic, retain) NSString * cityititle;
@property (nonatomic, retain) NSNumber * citynumber;
@property (nonatomic, retain) NSString * citypinin;
@property (nonatomic, retain) NSString * x;
@property (nonatomic, retain) NSString * y;
@property (nonatomic, retain) NSSet *zone_list;
@end

@interface CDCity (CoreDataGeneratedAccessors)

- (void)addZone_listObject:(CDZone *)value;
- (void)removeZone_listObject:(CDZone *)value;
- (void)addZone_list:(NSSet *)values;
- (void)removeZone_list:(NSSet *)values;

@end
