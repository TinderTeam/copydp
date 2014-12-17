//
//  CDCustomerUser.h
//  EShoping
//
//  Created by Seven on 14-12-16.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDUser;

@interface CDCustomerUser : NSManagedObject

@property (nonatomic, retain) NSNumber * user_id;
@property (nonatomic, retain) NSString * grade;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * cellphone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * car_id;
@property (nonatomic, retain) NSNumber * recommender_id;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * request;
@property (nonatomic, retain) NSString * login_date;
@property (nonatomic, retain) CDUser *user;

@end
