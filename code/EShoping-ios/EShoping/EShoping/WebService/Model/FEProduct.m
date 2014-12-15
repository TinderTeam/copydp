//
//  FEProduct.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProduct.h"
#import <hpple/TFHpple.h>

@implementation FEProduct

-(id)initWithDictionary:(id)dictionary{
    self = [super initWithDictionary:dictionary];
    if (self) {
        NSString *base = dictionary[@"basic_infor"];
        if (base && ![base isKindOfClass:[NSNull class]]) {
            NSData *htmlData = [base dataUsingEncoding:NSUTF8StringEncoding];
            NSString *nodeString = @"//img";
            TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
            NSArray *elements  = [xpathParser searchWithXPathQuery:nodeString];
            NSMutableString *string = [NSMutableString new];
            for (TFHppleElement *element in elements) {
                
                NSDictionary *elementContent =[element attributes];
                [string appendString:[elementContent objectForKey:@"src"]];
                [string appendString:@","];
            }
            _imglist = string;
        }
    }
    return self;
}


@end
