//
//  AppDelegate.h
//  EShoping
//
//  Created by Seven on 14-11-14.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "FECoreDataHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) FECoreDataHandler *coreDataHandler;

+(AppDelegate *)sharedDelegate;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

