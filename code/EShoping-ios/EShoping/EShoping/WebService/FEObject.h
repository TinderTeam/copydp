//
//  FEObject.h
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FEObject : NSObject

@property (nonatomic, strong, readonly) NSDictionary *dictionary;

-(id)initWithDictionary:(id)dictionary;

@end
