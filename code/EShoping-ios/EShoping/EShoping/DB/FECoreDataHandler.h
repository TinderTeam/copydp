//
//  FECoreDataHandler.h
//  SmartHome
//
//  Created by Seven on 14-10-22.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDUser;
@class CDCity;
@class CDZone;
@class CDCategory;
@class CDCustomerUser;

@interface FESortDescriptor : NSObject

@property (retain,nonatomic) NSString *key;
@property (assign,nonatomic) BOOL ascending;

+ (FESortDescriptor *)sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending;

@end

@interface FECoreDataHandler : NSObject{

@private
    NSManagedObjectContext *_managedObjectContext;
    
}

@property (retain,nonatomic) NSManagedObjectContext *managedObjectContext;

/*
 *  Create/Save/Delete coredata
 */
- (instancetype)initWithAppDelegateManagedObjectContext;

- (void)saveCoreData;
- (void)deleteCoreData:(NSArray *)array;

//fetch user information
-(CDUser *)fetchUser;
-(CDUser *)touchUserByIdentifier:(NSNumber *)identifier;
-(CDCustomerUser *)touchCustomerByIdentifier:(NSNumber *)identifier;
//city
-(NSArray *)fetchCity;
-(CDCity *)touchCityByName:(NSString *)cname;
-(CDCity *)fecthCityByName:(NSString *)cname;
-(NSArray *)fetchZoneByCity:(CDCity *)city;
-(CDZone *)fetchZoneByID:(NSNumber *)zid;
//zone
-(CDZone *)touchZoneByID:(NSNumber *)zid;
//catecory
-(CDCategory *)touchCategoryById:(NSNumber *)tid;
-(NSArray *)fetchCategory;

@end
