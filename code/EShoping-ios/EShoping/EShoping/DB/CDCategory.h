//
//  CDCategory.h
//  EShoping
//
//  Created by Seven on 14-12-8.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CDCategory : NSManagedObject

@property (nonatomic, retain) NSNumber * type_id;
@property (nonatomic, retain) NSString * type_name;
@property (nonatomic, retain) NSNumber * father_id;

@end
