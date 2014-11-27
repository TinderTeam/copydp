//
//  FEObject.m
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"
#import <objc/runtime.h>

@implementation FEObject

-(id)initWithDictionary:(id)dictionary{
    if (dictionary && ![dictionary isKindOfClass:[NSNull class]]) {
        self = [super init];
        if (self) {
            NSArray *property = [self getAllProperty];
            for (NSString *key in property) {
                if (![dictionary[key] isKindOfClass:[NSNull class]] && dictionary[key] != nil) {
                    @try {
                        [self setValue:dictionary[key] forKey:key];
                    }
                    @catch (NSException *exception) {
                        NSLog(@"error create object %@",exception);
                    }
                    @finally {
                        
                    }
                    
                }
            }
        }
        return self;
    }
    return nil;
    
}

- (NSDictionary *)dictionary{
    NSArray *property = [self getAllProperty];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    for (NSString *name in property) {
        
        if ([name isEqualToString:@"method"]) {
            break;
        }
        
        id item = [self valueForKey:name];
        if ([item isKindOfClass:[NSString class]] || [item isKindOfClass:[NSNumber class]] || [item isKindOfClass:[NSDictionary class]] || [item isKindOfClass:[NSArray class]]) {
            dic[name] = item;
        }
        
    }
    return dic;
}

//获取类的所有的 属性的名字
-(NSArray *)getAllProperty
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned int i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        [rv addObject:name];
    }
    free(properties);
    return rv;
}

@end
